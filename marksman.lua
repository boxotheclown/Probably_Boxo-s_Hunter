-- ProbablyEngine Rotation Packager
-- Created on Oct 20th 2014 1:10 pm
ProbablyEngine.rotation.register_custom(254, "Boxo's Marksman", {

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

  -- master's call when stuck
  { "53271", "player.state.stun" },
  { "53271", "player.state.root" },
  { "53271", "player.state.snare" },

-- cooldowns
	-- racials
	{{ 
		{ "Arcane Torrent", "player.focus >= 30" }, -- arcane torrent
		{ "26297", "player.spell(26297).exists" }, -- berserking
		{ "33697", "player.spell(33697).exists", }, -- Blood Fury
	}, "modifier.cooldowns", },

-- rotation
	{ "53351", { "target.health < 20", "player.timetomax > 3" } }, -- kill shot
	{ "Chimaera Shot" }, -- chimaera shot
	{ "3045", "modifier.cooldowns" }, -- rapid fire
	{ "121818", { -- stampede w/ rapid fire
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"player.buff(Rapid Fire)"
	}}, 
	{ "121818", { -- stampede w/ bloodlust
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"player.hashero"
	}},
	{ "121818", { -- stampede time to die 20 seconds
		"player.spell(121818).exists",
		"modifier.cooldowns",
		"target.ttd <= 20"
	}},
	{{ -- careful aim
		{{ -- aoe
			{ "Glaive Toss", "target.area(10).enemies > 4" },
			{ "Powershot", "player.timetomax > 3" },
			{ "Barrage" },
			{ "Aimed Shot", "player.focus > 60" },
			{ "Steady Shot" },
		}, "modifier.multitarget", },
		{ "Aimed Shot", "player.focus > 60" },
		{ "Steady Shot" },
	}, "target.health > 80" },
	
	{ "Explosive Trap", { -- explosive trap
		"target.ttd >= 18",
		"target.area(10).enemies > 2",
		"modifier.multitarget",
	}, "ground" }, 
	{ "131894", "player.spell(131894).exists" }, -- murder of crows
	{ "120679", { "player.spell(120679).exists", "player.timetomax > 3" } }, -- dire beast
	{ "120360", "player.spell(120360).exists" }, -- barrage
	{ "117050", "player.spell(117050).exists" }, -- glaive toss
	{ "2643", { -- multishot for 4+ targets
		"player.focus > 84",
		"modifier.multitarget",
		"target.area(10).enemies > 3"
	}},
	{ "2643", { -- multishot for 4+ targets and thrill of the hunt
		"player.focus > 64",
		"player.buff(34720).count >= 1",
		"modifier.multitarget",
		"target.area(10).enemies > 3"
	}},
	{ "Aimed Shot", "player.focus > 80" }, -- aimed shot dump
	{ "Aimed Shot", { "player.focus > 60", "player.buff(34720).count >= 1" } }, -- aimed shot dump with thrill of the hunt
	{ "Steady Shot" }, -- steady shot for lowbies

	},

-- out of combat
{
 	{ "pause","player.buff(5384)" }, -- Pause for Feign Death
	
}, function()
ProbablyEngine.toggle.create('md', 'Interface\\Icons\\ability_hunter_misdirection', 'Auto Misdirect', 'Automatially Misdirect when necessary')

end)