local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

esx 			    			= nil
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local isInZone                  = false
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

function mysplit (inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

Citizen.CreateThread(function()
	while esx == nil do
		TriggerEvent('esx:getSharedObject', function(obj) esx = obj end)
		Citizen.Wait(500)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	myJob = job.name
end)

AddEventHandler('esx_drugs:hasEnteredMarker', function(zone)
	if myJob == 'police' or myJob == 'ambulance' then
		return
	end
	local action = mysplit(zone, "_")
	esx.UI.Menu.CloseAll()
	local v = Config.Drugs[""..action[1]..""]
	if action[2] == 'Field' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect', action[1])
		CurrentActionData = {}
	end
	
	if action[2] == 'Processing' then
		esx.TriggerServerCallback('esx_drugs:getInventoryItem', function(qtd)
			if qtd.count >= v.QToProcess then
				CurrentAction     = zone
				CurrentActionMsg  = _U('press_process', action[1])
				CurrentActionData = {}
			end
		end, v.Item)
	end
	
	if action[2] == 'Dealer' then
		esx.TriggerServerCallback('esx_drugs:getInventoryItem', function(qtd)
			if qtd ~= nil and qtd.count >= v.QToSell then
				CurrentAction     = zone
				CurrentActionMsg  = _U('press_sell', action[1])
				CurrentActionData = {}
			end
		end, v.ItemTransform)
	end
end)

RegisterNetEvent('esx_drugs:hasExitedMarker')
AddEventHandler('esx_drugs:hasExitedMarker', function(zone)
	CurrentAction = nil
	esx.UI.Menu.CloseAll()
	TriggerServerEvent('esx_drugs:stopHarvest')
	TriggerServerEvent('esx_drugs:stopTransform')
	TriggerServerEvent('esx_drugs:stopSell')
end)

local NPCs = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(Config.Drugs) do
			for i,j in pairs(v.Zones) do
				if(GetDistanceBetweenCoords(coords, j.x, j.y, j.z, true) < Config.DrawDistance) then
					if i == 'Dealer' then
						if NPCs[k] == nil then
							RequestModel(j.NPCHash)
							while not HasModelLoaded(j.NPCHash) do
								Citizen.Wait(100)
							end
							NPCs[k] = CreatePed(1, j.NPCHash, j.x, j.y, j.z, j.h, false, true)
							SetBlockingOfNonTemporaryEvents(NPCs[k], true)
							SetPedDiesWhenInjured(NPCs[k], false)
							SetPedCanPlayAmbientAnims(NPCs[k], true)
							SetPedCanRagdollFromPlayerImpact(NPCs[k], false)
							SetEntityInvincible(NPCs[k], true)
							FreezeEntityPosition(NPCs[k], true)
							TaskStartScenarioInPlace(NPCs[k], "WORLD_HUMAN_SMOKING", 0, true);
						end
					else
						DrawMarker(Config.MarkerType, j.x, j.y, j.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end
			end
		end
	end
end)

if Config.ShowBlips then
	Citizen.CreateThread(function()
		for k,v in pairs(Config.Drugs) do
			for i,j in pairs(v.Zones) do
				local blip = AddBlipForCoord(j.x, j.y, j.z)

				SetBlipSprite (blip, j.sprite)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 0.8)
				SetBlipColour (blip, j.color)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(j.name)
				EndTextCommandSetBlipName(blip)
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local isInMarker  = false
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local currentZone = nil
		

		for k,v in pairs(Config.Drugs) do
			for i,j in pairs(v.Zones) do
				if(GetDistanceBetweenCoords(coords, j.x, j.y, j.z, true) < 2) then
					isInMarker  = true
					currentZone = k.."_"..i
				end
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
		end
	end
end)
status = false

Citizen.CreateThread(function()
    while true do
    --while the emote is being played for the bed, this thread will listen to any movement keys being pressed to cancel the emote
        if status then
            if 
                IsControlPressed(1, 73) --[[ "X" key ]]
            then
                ClearPedTasks(player);
                status = false
            end
        end
        Citizen.Wait(0)
    end
end)

function startEmote()
    if status == false then 
        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
        status = true
    else 
        return
    end
end

function getMarker()
	return hasAlreadyEnteredMarker
end

-- Disable Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if status then
		    DisableAllControlActions(1)
            EnableControlAction(0, Keys['X'], false)
            EnableControlAction(0, Keys['W'], false)
            EnableControlAction(0, Keys['A'], false)
            EnableControlAction(0, Keys['S'], false)
            EnableControlAction(0, Keys['D'], false)
            EnableControlAction(0, Keys['SPACE'], false)
		else
			Citizen.Wait(500)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CurrentAction ~= nil then
			local playerPed = PlayerPedId()
			PedPosition		= GetEntityCoords(playerPed)
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, Keys['E']) then
				local action = mysplit(CurrentAction, '_')
				local cops = Config.Drugs[""..action[1]..""]
				local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
				isInZone = true
				if IsPedInAnyVehicle(GetPlayerPed(-1), 0) then
					TriggerEvent('esx:showNotification', _U('foot_work'))
				elseif action[2] == "Field" then
					esx.ShowHelpNotification(_U('stop_action', Config.KeyStopAction))
					TriggerServerEvent('esx_drugs:startHarvest', action[1])
					--TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
					startEmote()
				elseif action[2] == "Processing" then
					TriggerServerEvent('esx_drugs:startTransform', action[1])
					startEmote()
				elseif action[2] == "Dealer" then
					TriggerServerEvent('esx_drugs:startSell', action[1])
				else
					isInZone = false
				end
				CurrentAction = nil
			end
		elseif CurrentAction == nil and IsControlJustReleased(0, Keys[Config.KeyStopAction]) then
			TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
		end
	end
end)