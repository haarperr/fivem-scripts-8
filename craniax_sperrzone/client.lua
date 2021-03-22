ESX 			    			= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('sperrzone:message')
AddEventHandler('sperrzone:message', function(grund)
	TriggerEvent("craniax_notify", "red", "SPERRZONE", grund)
TriggerEvent('chat:addMessage', {
  color = { 255, 0, 0},
  multiline = true,
  args = {"[SPERRZONE]", grund}
})
end)

RegisterNetEvent('sperrzone:blip')
AddEventHandler('sperrzone:blip', function(player, _radius)
local arg = math.floor(_radius * 6.4)
local radius = tonumber(arg .. '.0')
local blip = AddBlipForRadius(player.x, player.y, player.z, radius)

SetBlipSprite(blip, 3)
SetBlipHiddenOnLegend(blip, false)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString('Polizei Sperrzone ' .. _radius .. ' Meter') -- set blip's "name"
EndTextCommandSetBlipName(blip)
SetBlipAlpha(blip, 60)
Citizen.Wait(300000)
RemoveBlip(blip)
end)
