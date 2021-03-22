esx								= nil
local CopsConnected				= 0
local PlayersHarvesting			= {}
local PlayersTransforming		= {}
local PlayersSelling			= {}
local Drug						= {}

TriggerEvent('esx:getSharedObject', function(obj) esx = obj end)

function CountCops()
	local xPlayers = esx.GetPlayers()
	CopsConnected = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = esx.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end
	SetTimeout(120 * 1000, CountCops)
end

CountCops()

local function Harvest(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToFarm * 1000, function()
		if PlayersHarvesting[source] == true and Drug[source] == drug then
			local xPlayer  = esx.GetPlayerFromId(source)
			local item = xPlayer.getInventoryItem(v.Item)
			local qtd = math.random(1, 4)
			--if xPlayer.canCarryItem(v.Item, qtd) then
			--if v.Item >= 500 then
				--xPlayer.addInventoryItem(v.Item, qtd)
				--Harvest(source, drug)
			--else
				--TriggerClientEvent('craniax_legal:hasExitedMarker', source)
				--TriggerClientEvent('esx:showNotification', source, "~r~Dein Inventar ist voll!")
			--end

			if item.limit ~= -1 and item.count >= item.limit then
				--TriggerClientEvent('esx:showNotification', source, _U('jajajja'))
				--TriggerClientEvent("craniax_notify", source, "#eb4034", "Information", "Du hast " ... qtd ... "x " ... item ... "gesammelt")
				TriggerClientEvent('craniax_notify', source, "#eb4034", "Information", "Dein Inventar ist voll")
			else
				xPlayer.addInventoryItem(v.Item, qtd)
				Harvest(source, drug)
				TriggerClientEvent('craniax_notify', source, "#E16E0F", "Information", "Du hast " .. qtd .. "x " .. item.label .. " gesammelt")
			end
		end
	end)
end

RegisterServerEvent('craniax_legal:startHarvest')
AddEventHandler('craniax_legal:startHarvest', function(drug)
	local _source = source
	PlayersHarvesting[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, "~y~Du sammelst..")
	Harvest(_source, drug)
end)

RegisterServerEvent('craniax_legal:stopHarvest')
AddEventHandler('craniax_legal:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
	Drug[source] = false
end)

local function Transform(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToProcess * 1000, function()
		if PlayersTransforming[source] == true and Drug[source] == drug then
			local _source = source
			local xPlayer = esx.GetPlayerFromId(_source)
			local itemQuantity = xPlayer.getInventoryItem(v.Item).count
			local transformQuantity = xPlayer.getInventoryItem(v.ItemTransform).count
			if transformQuantity > 100 then
				--TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				TriggerClientEvent('craniax_notify', source, "#eb4034", "Information", "Dein Inventar ist voll")
			elseif itemQuantity < 25 then
				TriggerClientEvent('craniax_notify', source, "#eb4034", "Information", "Du hast zu wenig gesammelt, um es zu verarbeiten")
			else
				xPlayer.removeInventoryItem(v.Item, 25)
				xPlayer.addInventoryItem(v.ItemTransform, 1)
				Transform(source, drug)
				TriggerClientEvent('craniax_notify', source, "#E16E0F", "Information", "Du hast noch " .. itemQuantity .. " gesammelte Items zu verarbeiten")
			end

		end
	end)
end

RegisterServerEvent('craniax_legal:startTransform')
AddEventHandler('craniax_legal:startTransform', function(drug)
	local _source = source
	PlayersTransforming[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	Transform(_source, drug)
end)

RegisterServerEvent('craniax_legal:stopTransform')
AddEventHandler('craniax_legal:stopTransform', function()
	local _source = source
	PlayersTransforming[_source] = false
	Drug[source] = false
end)

local function Sell(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToSell * 1000, function()
		if PlayersSelling[source] == true and Drug[source] == drug then
			local _source = source
			local xPlayer = esx.GetPlayerFromId(_source)

			local item = xPlayer.getInventoryItem(v.ItemTransform).count

			if item == 0 then
				TriggerClientEvent('craniax_notify', source, "#eb4034", "Information", "Du hast zu wenig Items in deinem Inventar")
			else
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				xPlayer.addMoney(math.random(700, 1000))
				--TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				TriggerClientEvent('craniax_notify', source, "#E16E0F", "Information", "Du hast 1x " .. v.ItemTransform .. " verkauft")
				Sell(source, drug)
			end

		end
	end)
end

RegisterServerEvent('craniax_legal:startSell')
AddEventHandler('craniax_legal:startSell', function(drug)
	local _source = source
	PlayersSelling[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	Sell(_source, drug)
end)

RegisterServerEvent('craniax_legal:stopSell')
AddEventHandler('craniax_legal:stopSell', function()
	local _source = source
	PlayersSelling[_source] = false
	Drug[source] = false
end)

esx.RegisterServerCallback('craniax_legal:getInventoryItem', function(source, cb, item)
	local _source = source
	local xPlayer = esx.GetPlayerFromId(source)
	local oItem = xPlayer.getInventoryItem(item)
	cb(oItem)
end)

--for k,v in pairs(Config.Drugs) do
	--if v.Usable then
		--esx.RegisterUsableItem(v.Item, function(source)
			--local _source = source
			--local xPlayer = esx.GetPlayerFromId(_source)

			--xPlayer.removeInventoryItem(v.Item, 5)
			--if v.UseEffect then
				--TriggerClientEvent('craniax_legal:onUse', _source, v.Item)
			--end
			--TriggerClientEvent('esx:showNotification', _source, _U('used_one', k))
		--end)
	--end
--end