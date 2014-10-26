-- ProbablyEngine Rotation Packager
-- Created on Oct 20th 2014 1:10 pm
ProbablyEngine.rotation.register_custom(254, "Boxo's Marksman", {

-- Pause Rotation
	{ "pause", "modifier.lshift" },
	{ "pause","player.buff(5384)" }, -- Pause for Feign Death

-- interrupt
	{ "147362", "target.interruptAt(30)" }, -- Counter Shot at 70% cast time left

-- pet stuff
	{ "Heart of the Phoenix", "pet.dead" }, -- heart of the phoenix
	{ "Revive Pet", "pet.dead" }, -- revive pet
	
-- defensives
	{ "109304", "player.health < 50" }, -- Exhiliration
	{ "19263", "player.health < 10" }, -- Deterrence as a last resort
	{ "#5512", "player.health < 40" }, -- Healthstone
	{ "136", { -- Mend Pet
		"pet.health <= 75",
		"pet.exists",
		"!pet.dead",
		"!pet.buff(136)"
	}},

-- trap
	{ "Explosive Trap", "modifier.lcontrol", "mouse.ground" }, -- explosive trap

-- Misdirect
	{{
		{ "Misdirect", { "focus.exists", "!player.buff(Misdirect)" }, "focus" },
		{ "Misdirect", {
			"pet.exists",
			"!pet.dead",
			"!player.buff(Misdirect)",
			"!focus.exists",
			"target.threat > 85"
		}, "pet" },
	}, "toggle.md", },



-- cooldowns
	{ "26297", { "player.spell(26297).exists", "modifier.cooldowns" } }, -- Berserking
	{ "33697", { "player.spell(33697).exists", "modifier.cooldowns" } }, -- Blood Fury
	{ "120679", "player.spell(120679).exists" }, -- dire beast
	{ "3045", "modifier.cooldowns" }, -- rapid fire
	{ "121818", { -- stampede w/ rapid fire
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"player.buff(Rapid Fire)"
	} }, 
	{ "121818", { -- stampede w/ bloodlust
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"player.hashero"
	} },
	{ "121818", { -- stampede time to die 20 seconds
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"target.ttd <= 20"
	} },
-- multi-target
	{{

-- 5 + units
	{{

		{ "Chimaera Shot" }, -- chimaera shot
		{ "2643", "player.focus > 60" }, -- multishot
		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	}, "target.area(8).enemies > 3" },


-- 2 - 4 units
		{ "Chimaera Shot" }, -- chimaera shot
		{ "53351", "target.health < 20" }, -- kill shot
		{ "Aimed Shot", "player.buff(34720).count >= 1" }, -- aimed shot toth
		{ "131894", "player.spell(131894).exists" }, -- murder of crows
		{ "120360", "player.spell(120360).exists" }, -- barrage
		{ "117050", "player.spell(117050).exists" }, -- glaive toss
		{ "Aimed Shot", "player.focus > 60" }, -- arcane shot dump
		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	} , "modifier.multitarget" },

-- single target
	{{
		{ "Chimaera Shot" }, -- chimaera shot
		{ "53351", "target.health < 20" }, -- kill shot
		{ "Aimed Shot", "player.buff(34720).count >= 1" }, -- aimed shot toth
		{ "131894", "player.spell(131894).exists" }, -- murder of crows
		{ "120360", "player.spell(120360).exists" }, -- barrage
		{ "117050", "player.spell(117050).exists" }, -- glaive toss
		{ "Aimed Shot", "player.focus > 60" }, -- aimed shot dump
		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	} , "!modifier.multitarget" },
	},

-- out of combat
{
 	{ "pause","player.buff(5384)" }, -- Pause for Feign Death
	
}, function()
ProbablyEngine.toggle.create('md', 'Interface\\Icons\\ability_hunter_misdirection', 'Auto Misdirect', 'Automatially Misdirect when necessary')

end)