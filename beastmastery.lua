-- ProbablyEngine Rotation Packager
-- Created on Oct 20th 2014 1:10 pm
ProbablyEngine.rotation.register_custom(253, "Boxo's BM", {

-- Pause Rotation
	{ "pause", "modifier.lshift" },
	{ "pause","player.buff(5384)" }, -- Pause for Feign Death

-- interrupt
	{ "147362", "target.interruptAt(30)" }, -- Counter Shot at 70% cast time left
	{ "Tranquilizing Shot", { "target.dispellable(Tranquilizing Shot)", "!target.charmed", "!target.state.charm", "!target.debuff(Touch of Y'Shaarj)", "!target.debuff(Empowered Touch of Y'Shaarj)", "!target.buff(Touch of Y'Shaarj)", "!target.buff(Empowered Touch of Y'Shaarj)" }, "target" },
-- pet stuff
	{ "Heart of the Phoenix", "pet.dead" }, -- heart of the phoenix
	{ "Revive Pet", "pet.dead" }, -- revive pet

-- CC chain
--	{ "Freezing Trap", { "focus.exists", "focus.debuff.duration < 10" }, "focus.ground" },
	
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
--	{ "Ice Trap", "modifier.lalt", "ground" },
	{ "Binding Shot", "modifier.lalt", "ground" },

-- pet pause
--	{ "Concussive Shot" },

--	{ "pause", "target.health < 30" },

-- Misdirect
	{{
		{ "34477", { "focus.exists", "!player.buff(35079)" }, "focus" },
		{ "34477", {
			"pet.exists",
			"!pet.dead",
			"!player.buff(35079)",
			"!focus.exists",
			"target.threat > 85"
		}, "pet" },
	}, "toggle.md", },

-- cooldowns
	{{ -- racials
		{ "Arcane Torrent", "player.focus >= 30" }, -- arcane torrent
		{ "26297", "player.spell(26297).exists" }, -- berserking
		{ "33697", "player.spell(33697).exists", }, -- Blood Fury
	}, "modifier.cooldowns", }, 
	{ "121818", {  -- stampede when boss about to die
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"target.ttd <= 20"
	} },
	{ "121818", {  -- stampede when focus fire up
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"player.buff(Focus Fire)"
	} },
	{ "121818", {  -- stampede when bloodlust up
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"player.hashero"
	} },	
	{ "120679", "player.spell(120679).exists" }, -- dire beast
	{ "19574", { -- bestial wrath
		"player.spell(34026).cooldown = 0",
		"player.focus > 60",
		"pet.exists"
	} }, 
	
-- multi-target
	{{
	
	{ "Explosive Trap", { "target.ttd >= 20", "target.area(10).enemies >  2" }, "ground" }, -- explosive trap
	{ "120360", { "player.spell(120360).exists", "target.area(10).enemies > 2" } }, -- barrage multitarget
-- 9 + units
	{{

		{ "2643", "!player.buff(118455).exists" }, -- multishot for beast cleave
--		{ "34026", "pet.exists" }, -- kill command
		{ "2643", "player.focus > 60" }, -- multishot
		{ "77767", "player.focus <= 60" }, -- cobra shot
--		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	}, "target.area(8).enemies > 8" },


-- 2 - 4 units
		{ "2643", { "!pet.buff(118455).exists", "target.area(8).enemies > 2" } }, -- multishot for beast cleave (3+)
		{ "120360", { "player.spell(120360).exists", "target.area(8).enemies > 1" } }, -- barrage
		{ "34026", "pet.exists" }, -- kill command
		{ "2643", "!pet.buff(118455).exists" }, -- multishot for beast cleave (2 targets)
		{ "53351", "target.health < 20" }, -- kill shot
		{ "131894", "player.spell(131894).exists" }, -- murder of crows
		{ "120360", "player.spell(120360).exists" }, -- barrage
		{ "117050", "player.spell(117050).exists" }, -- glaive toss
--		{ "82692", "player.buff(19615).count = 5" }, -- yolo focus fire
		{ "82692", { "player.buff(Frenzy).count = 5", "!player.buff(Bestial Wrath)" } }, -- focus fire outside bestial wrath
		{ "82692", { "player.buff(Frenzy).count = 5", "player.buff(Bestial Wrath).duration >= 3" } }, -- focus fire inside bestial wrath
		{ "2643", { "player.focus > 63", "target.area(8).enemies > 2" } }, -- multishot dump
		{ "3044", "player.focus > 63" }, -- arcane shot dump
		{ "77767", "player.focus <= 63" }, -- cobra shot
--		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	} , "modifier.multitarget" },

-- single target
	{{
		{ "34026", "pet.exists" }, -- kill command
		{ "53351", "target.health < 20" }, -- kill shot
		{ "131894", "player.spell(131894).exists" }, -- murder of crows
		{ "77767", "player.buff(Steady Focus)" }, -- steady focus buff
		{ "120360", "player.spell(120360).exists" }, -- barrage
		{ "117050", "player.spell(117050).exists" }, -- glaive toss
--		{ "82692", "player.buff(Frenzy).count = 5" }, -- yolo focus fire
		{ "82692", { "player.buff(Frenzy).count = 5", "!player.buff(Bestial Wrath)" } }, -- focus fire outside bestial wrath
		{ "82692", { "player.buff(Frenzy).count = 5", "player.buff(Bestial Wrath).duration >= 3" } }, -- focus fire inside bestial wrath
		{ "3044", "player.focus > 63" }, -- arcane shot dump
		{ "77767", "player.focus <= 63" }, -- cobra shot
--		{ "Steady Shot", "player.focus <= 60" }, -- steady shot for lowbies

	} , "!modifier.multitarget" },
	},

-- out of combat
{
 	{ "pause","player.buff(5384)" }, -- Pause for Feign Death
	{ "Freezing Trap", "modifier.lalt", "mouse.ground" },
--	{ "Freezing Trap", { "focus.exists", "focus.debuff.duration < 10" }, "focus.ground" },
}, function()
ProbablyEngine.toggle.create('md', 'Interface\\Icons\\ability_hunter_misdirection', 'Auto Misdirect', 'Automatially Misdirect when necessary')

end)