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
	{ "120679", "player.spell(120679).exists" }, -- dire beast
	{ "3045", "modifier.cooldowns" }, -- rapid fire
	
-- multi-target
	{{

-- 5 + units
	{{

		{ "2643", "!player.buff(115939).exists" }, -- multishot
		{ "34026" }, -- kill command
		{ "2643", "player.focus > 60" }, -- multishot
--		{ "77767", "player.focus <= 60" }, -- cobra shot
		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	}, { (function() return UnitsAroundUnit('target', 8) >= 5 end) },
	},

-- 2 - 4 units
		{ "53351", "target.health < 20" }, -- kill shot
		{ "2643", { "!player.buff(115939).exists", (function() return UnitsAroundUnit('target', 8) >= 3 end) } }, -- multishot for beast cleave (3+)
		{ "34026" }, -- kill command
		{ "2643", "!pet.buff(115939).exists" }, -- multishot for beast cleave (2 targets)
		{ "131894", "player.spell(131894).exists" }, -- murder of crows
		{ "120360", "player.spell(120360).exists" }, -- barrage
		{ "117050", "player.spell(117050).exists" }, -- glaive toss
		{ "82692", { "player.buff(19623).count = 5", "!player.buff(19574)" } }, -- focus fire outside bestial wrath
		{ "82692", { "player.buff(19623).count = 5", "player.buff(19574).duration >= 3" } }, -- focus fire inside bestial wrath
		{ "3044", "player.focus > 60" }, -- arcane shot dump
--		{ "77767", "player.focus <= 60" }, -- cobra shot
		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	} , "modifier.multitarget" },

-- single target
	{{
		{ "53351", "target.health < 20" }, -- kill shot
		{ "34026" }, -- kill command
		{ "131894", "player.spell(131894).exists" }, -- murder of crows
		{ "120360", "player.spell(120360).exists" }, -- barrage
		{ "117050", "player.spell(117050).exists" }, -- glaive toss
		{ "82692", { "player.buff(19623).count = 5", "!player.buff(19574)" } }, -- focus fire outside bestial wrath
		{ "82692", { "player.buff(19623).count = 5", "player.buff(19574).duration >= 3" } }, -- focus fire inside bestial wrath
		{ "3044", "player.focus > 60" }, -- arcane shot dump
--		{ "77767", "player.focus <= 60" }, -- cobra shot
		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	} , "!modifier.multitarget" },
	},

-- out of combat
{
 	{ "pause","player.buff(5384)" }, -- Pause for Feign Death
	
}, function()
ProbablyEngine.toggle.create('md', 'Interface\\Icons\\ability_hunter_misdirection', 'Auto Misdirect', 'Automatially Misdirect when necessary')

end)