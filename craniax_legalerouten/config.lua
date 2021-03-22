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
	[_U('orange')] = {
		Item			= 'orange',				 	-- Item to pickup
		ItemTransform	= 'orangensaft', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 6,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 8,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= true,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field 			= {x = 2225.93,	y = 5576.79,	z = 53.96,	name = _U('field', _U('orange')),			sprite = 479,	color = 2, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 966.27,	y = -1933.29,	z = 31.13,	name = _U('processing', _U('orange')),	sprite = 499,	color = 2, callPolice = false, callPoliceChance = 100},
			Dealer 			= {x = -277.72,	y = 2205.48,	z = 129.4, h = 45.24,	name = _U('dealer', _U('orange')),		sprite = 500,	color = 2, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = false},
		}
	},
	-- Translated name
	[_U('erdnuss')] = {
		Item			= 'erdnuss',				 	-- Item to pickup
		ItemTransform	= 'erdnussbutter', 			-- Item to transform
		AlertCops 		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 6,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 8,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
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
			Field 			= {x = 1525.29,	y = 1710.02,	z = 109.00,	        name = _U('field', _U('erdnuss')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -384.54,	y = 153.00,	z = 65.53,	name = _U('processing', _U('erdnuss')),	sprite = 499,	color = 3, callPolice = false, callPoliceChance = 100},
			Dealer 		= {x = -2253.82,	y = 233.87,	z = 173.61, h = 45.24,	name = _U('dealer', _U('erdnuss')),		sprite = 500,	color = 3, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 500, sellMax = 1000 , multiplierPolice = false},
		}
	},
	-- Translated name
	[_U('apfel')] = {
		Item			= 'apfel',				 	-- Item to pickup
		ItemTransform	= 'apfelsaft', 			-- Item to transform
		AlertCops 		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 6,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 8,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
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
			Field 			= {x = 2877.91,	y = 4563.83,	z = 47.71,	        name = _U('field', _U('apfel')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -1469.63, y = -366.75,   z = 39.21,		name = _U('processing', _U('apfel')),	sprite = 499,	color = 5, callPolice = false, callPoliceChance = 100},
			Dealer 	= {x = 1534.57,	y = 2221.83,	z = 76.2, h = 87.63,	name = _U('dealer', _U('apfel')),	    sprite = 500,	color = 5, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 800, sellMax = 1250, multiplierPolice = false},
		}
	},
	-- Translated name
	[_U('zitrone')] = {
		Item			= 'zitrone',				 	-- Item to pickup
		ItemTransform	= 'zitronenlimonade', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 10,						-- Quantity necessary to process
		QToSell			= 5,						-- Quantity necessary to sell
		TimeToFarm		= 8,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
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
			Field 			= {x = -1217.5,	y = 4449.0,	z = 30.22,	name = _U('field', _U('zitrone')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 279.28,	y = 6783.06,	z = 15.7,  name = _U('processing', _U('zitrone')),	    sprite = 499,	color = 17, callPolice = false, callPoliceChance = 100},
			Dealer 			= {x = 1180.45,	y = -3308.1,   z = 6.03,	name = _U('dealer', _U('zitrone')),		sprite = 500,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false}
		}
	}
}