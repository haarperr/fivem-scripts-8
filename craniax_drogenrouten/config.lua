Config              	= {}
Config.MarkerType   	= 1
Config.DrawDistance 	= 100.0
Config.ZoneSize     	= {x = 8, y = 4, z = 0.5}
Config.MarkerColor  	= {r = 100, g = 204, b = 100}
Config.KeyStopAction 	= 'X'
Config.ShowBlips    	= false

Config.Locale 			= 'de'

Config.Drugs = {
	[_U('meth')] = {
		Item			= 'meth',				 	-- Item to pickup
		ItemTransform	= 'meth_pooch', 			-- Item to transform
		AlertCops		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 39,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 8,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones			= {
			Field 			= {x = 946.45,	y = -1698.12,	z = 30.09,	name = _U('field', _U('meth')),			sprite = 479,	color = 2, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 2478.1,	y = -401.99,	z = 94.82,	name = _U('processing', _U('meth')),	sprite = 499,	color = 2, callPolice = false, callPoliceChance = 100},
			Dealer 			= {x = 1134.98,	y = -789.7,	z = 56.6, h = 179.43,	name = _U('dealer', _U('meth')),		sprite = 500,	color = 2, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = false},
		}
	},
	[_U('lsd')] = {
		Item			= 'lsd',				 	-- Item to pickup
		ItemTransform	= 'lsd_pooch', 			-- Item to transform
		AlertCops 		= false, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 35,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 8,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 4,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones 			= {
			Field 			= {x = -446.24,	y = 1600.12,	z = 358.27,	        name = _U('field', _U('lsd')),			sprite = 479,	color = 3, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -110.33,	y = -14.33,	z = 70.52,	name = _U('processing', _U('lsd')),	sprite = 499,	color = 3, callPolice = false, callPoliceChance = 100},
			Dealer 		= {x = 740.08,	y = 2577.46,	z = 74.4, h = 200.49,	name = _U('dealer', _U('lsd')),		sprite = 500,	color = 3, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 500, sellMax = 1000 , multiplierPolice = false},
		}
	},
	-- Translated name
	--[_U('coke')] = {
	--	Item			= 'coke',				 	-- Item to pickup
	--	ItemTransform	= 'coke_pooch', 			-- Item to transform
	--	AlertCops 		= false, 					-- Alert police?
	--	RequiredCops	= 0, 						-- How many cops need to the action start??
	--	QToProcess		= 49,						-- Quantity necessary to process
	--	QToSell			= 1,						-- Quantity necessary to sell
	--	TimeToFarm		= 8,						-- Time to farm in seconds
	--	TimeToProcess	= 5,						-- Time to process in seconds
	--	TimeToSell		= 4,						-- Time to sell in seconds
	--	Usable			= false,						-- Can it be consumed?
	--	UseEffect		= false,						-- Effect after consume
	--	Zones 			= {
	--		Field 			= {x = 245.19,	y = 370.57,	z = 105.74,	        name = _U('field', _U('coke')),		sprite = 479,	color = 5, callPolice = false, callPoliceChance = 100},
	--		Processing 		= {x = 2434.79, y = 4968.85,   z = 42.36,		name = _U('processing', _U('coke')),	sprite = 499,	color = 5, callPolice = false, callPoliceChance = 100},
	--		Dealer 	= {x = 2127.65,	y = 4770.92,	z = 39.97, h = 290.4,	name = _U('dealer', _U('coke')),	    sprite = 500,	color = 5, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 800, sellMax = 1250, multiplierPolice = false},
	--	}
	--}
	-- Translated name
--	[_U('heroin')] = {
--		Item			= 'heroin',				 	-- Item to pickup
--		ItemTransform	= 'heroin_pooch', 			-- Item to transform
--		AlertCops		= false, 					-- Alert police?
--		RequiredCops	= 0, 						-- How many cops need to the action start??
--		QToProcess		= 42,						-- Quantity necessary to process
--		QToSell			= 1,						-- Quantity necessary to sell
--		TimeToFarm		= 8,						-- Time to farm in seconds
--		TimeToProcess	= 5,						-- Time to process in seconds
--		TimeToSell		= 4,						-- Time to sell in seconds
--		Usable			= true,						-- Can it be consumed?
--		UseEffect		= false,						-- Effect after consume
--		Zones 			= {
--			-- Field: Farm location
--			-- Processing: Process location
--			-- Dealer: Seller location
--			-- callPolice: true/false, call the police in the position?
--			-- callPoliceChance: chance in percentage to call the police
--			-- sellMin: Min receveid by selling
--			-- sellMax: Max received by selling
--			-- multiplierPolice: true/false Multiply the min/max based on cops online
--			Field 			= {x = -1217.5,	y = 4449.0,	z = 30.22,	name = _U('field', _U('heroin')),			sprite = 479,	color = 17, callPolice = false, callPoliceChance = 100},
--			Processing 		= {x = 279.28,	y = 6783.06,	z = 15.7,  name = _U('processing', _U('heroin')),	    sprite = 499,	color = 17, callPolice = false, callPoliceChance = 100},
--			Dealer 			= {x = 1180.45,	y = -3308.1,   z = 6.03,	name = _U('dealer', _U('heroin')),		sprite = 500,	color = 17, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 1000, sellMax = 1500, multiplierPolice = false}
--		}
--	}
}