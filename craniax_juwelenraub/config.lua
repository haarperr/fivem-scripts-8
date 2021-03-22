Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.policeNumberRequired = 7
Config.TimerBeforeNewRob    = 3600 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["juwelier"] = {
		position = { x = -622.19, y = -230.87, z = 38.06 },
		reward = math.random(750000, 1000000),
		nameOfStore = "Juwelier",
		secondsRemaining = 500, -- seconds
		lastRobbed = 0
	}
}
