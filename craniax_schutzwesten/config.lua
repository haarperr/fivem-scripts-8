Config              	= {}
Config.MarkerType   	= 1
Config.DrawDistance 	= 100.0
Config.ZoneSize     	= {x = 8, y = 4, z = 0.5}
Config.MarkerColor  	= {r = 100, g = 204, b = 100}
Config.KeyStopAction 	= 'X'
-- Show blip in map?
Config.ShowBlips    	= true

Config.Locale 			= 'de'

-- Before add any drug/item here you have to add the translation of the item
Config.Drugs = {
	-- Translated name
	[_U('bulletproof')] = {
		Item			= 'fasern',				 	-- Item to pickup
		ItemTransform	= 'stoff', 			-- Item to transform
		ItemSelling	= 'bulletproof', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 30,						-- Quantity necessary to process
		QToSell			= 35,						-- Quantity necessary to sell
		TimeToFarm		= 8,						-- Time to farm in seconds
		TimeToProcess	= 8,						-- Time to process in seconds
		TimeToSell		= 5,						-- Time to sell in seconds
		Usable			= true,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field 			= {x = -591.19519042969,	y = 5341.7905273438,	z =70.243156433105,	name = _U('field', _U('bulletproof')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 1453.2823486328,	y = 3755.1328125,	z = 31.934175491333,  name = _U('processing', _U('bulletproof')),	    sprite = 499,	color = 17, callPolice = false, callPoliceChance = 100},
			Dealer 			= {x = 3819.8366699219,	y = 4440.701171875,   z = 1.8059210777283,	name = _U('dealer', _U('bulletproof')),		sprite = 500,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false}
		}
	}
}