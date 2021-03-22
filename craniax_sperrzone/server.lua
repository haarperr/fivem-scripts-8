
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("sperrzone", function(source, args)

local xPlayers = ESX.GetPlayers()
    local source = source
    local xPlayerr = ESX.GetPlayerFromId(source)
	local coords = xPlayerr.getCoords(true)
	local _player = xPlayerr.getName()
	local radius = tonumber(args[1])
if source > 0 then	
	

            --local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			
			local scale = args[1]
			if xPlayerr.job.name == 'police' or xPlayerr.job.name == 'fib' then
			  if #args ~= 0 then	
				TriggerClientEvent('sperrzone:blip', -1, coords, radius)
				TriggerClientEvent("craniax_notify", -1, "red", "SPERRZONE", 'EINE NEUE SPERRZONE WURDE EINGERICHTET! Der Radius dieser Sperrzone beträgt ' .. args[1] .. ' Meter. Mfg: ' .. _player .. '.')
			  else
			  TriggerClientEvent('sperrzone:message', source, 'Du musst einen Radius eingeben, Bsp.: /sperrzone 500!')
			  end
			else
			TriggerClientEvent('sperrzone:message', source, 'Du bist kein Polizist oder FIBler')
			end
        

else
print('Der Command kann nur von einem Spieler ausgeführt werden!')
end
end, false)
