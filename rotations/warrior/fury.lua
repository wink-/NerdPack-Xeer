local GUI = {

}

local exeOnLoad = function()

	Xeer.Splash()

	print("|cffADFF2F ----------------------------------------------------------------------|r")
	print("|cffADFF2F --- |rWARRIOR |cffADFF2FFury |r")
	print("|cffADFF2F --- |rRecommended Talents: 1/2 - 2/2 - 3/3 - 4/2 - 5/1 - 6/3 - 7/3")
	print("|cffADFF2F ----------------------------------------------------------------------|r")
	
end

local _Xeer = {

	{'@Xeer.Targeting()', {'!target.alive', 'toggle(autotarget)'}},
	
	--actions=charge
	{'Charge', 'target.range>8&target.range<=25&target.infront'},

--[[
warrior="Warrior_Fury_T19P"
level=110
race=tauren
role=attack
position=back
talents=2232133
artifact=35:0:0:0:0:982:1:984:1:985:1:986:1:988:3:990:3:991:3:995:3:996:3:1357:1
spec=fury
]]	--

}

local PreCombat = {

	--# Executed before combat begins. Accepts non-harmful 	--actions only.
	--actions.precombat=flask,type=countless_armies
	--actions.precombat+=/food,type=nightborne_delicacy_platter
	--actions.precombat+=/augmentation,type=defiled
	--# Snapshot raid buffed stats before combat begins and pre-potting is done.
	--actions.precombat+=/snapshot_stats
	--actions.precombat+=/potion,name=old_war

}


local Survival = {

-- {'', ''},

}

local Cooldowns = {

-- {'', ''},

}

local Util = {

	--# Executed every time the actor is available.

	--actions+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)||!raid_event.movement.exists
	--manual usage of leap via keybind... 
	--actions+=/use_item,name=faulty_countermeasure,if=(spell_targets.whirlwind>1||!raid_event.adds.exists)&((talent.bladestorm.enabled&cooldown.bladestorm.remains=0)||buff.battle_cry.up||target.time_to_die<25)
	
	--actions+=/potion,name=old_war,if=(target.health.pct<20&buff.battle_cry.up)||target.time_to_die<30
	
	--actions+=/battle_cry,if=(cooldown.odyns_fury.remains=0&(cooldown.bloodthirst.remains=0||(buff.enrage.remains>cooldown.bloodthirst.remains))) 
	{'Battle Cry', '{spell(Odyn\'s Fury).cooldown=0&{spell(Bloodthirst).cooldown=0||{buff(Enrage).duration>spell(Bloodthirst).cooldown}}}'},

	
	--actions+=/avatar,if=buff.battle_cry.up||(target.time_to_die<(cooldown.battle_cry.remains+10))
	{'Avatar', 'buff(Battle Cry)'}, --todo: TTD<{spell(Battle Cry).cooldown+10}
	
	--actions+=/bloodbath,if=buff.dragon_roar.up||(!talent.dragon_roar.enabled&(buff.battle_cry.up||cooldown.battle_cry.remains>10))
	{'Bloodbath', 'buff(Dragon Roar)||{!talent(7,3)&{buff(Battle Cry)||spell(Battle Cry).cooldown>10}}'},
	
	--actions+=/blood_fury,if=buff.battle_cry.up
	{'Blood Fury', 'buff(Battle Cry)'},
	
	--actions+=/berserking,if=buff.battle_cry.up
	{'Berserking', 'buff(Battle Cry)'},
	
	--actions+=/arcane_torrent,if=rage<rage.max-40
	--{'Arcane Torrent', 'rage<60'},

}

local Bladestorm = {

	--actions.bladestorm=bladestorm,if=buff.enrage.remains>2&(raid_event.adds.in>90||!raid_event.adds.exists||spell_targets.bladestorm_mh>desired_targets)
	{'Bladestorm', 'talent(7,1)&buff(Enrage).duration>2'}, --raid_event not supported
	
}

local AoE = {

	--actions.aoe=bloodthirst,if=buff.enrage.down||rage<50
	{'Bloodthirst', '!buff(Enrage)||rage<50'},
	
	--actions.aoe+=/call_action_list,name=bladestorm
	{Bladestorm},

	--actions.aoe+=/whirlwind,if=buff.enrage.up
	{'Whirlwind', 'buff(Enrage)'},
	
	--actions.aoe+=/dragon_roar
	{'Dragon Roar', 'talent(7,3)'},
	
	--actions.aoe+=/rampage,if=buff.meat_cleaver.up
	{'Rampage', 'buff(Meat Cleaver)'},
	
	--actions.aoe+=/bloodthirst
	{'Bloodthirst'},
	
	--actions.aoe+=/whirlwind
	{'Whirlwind'},

}


local ST = {

	--actions.single_target=bloodthirst,if=buff.fujiedas_fury.up&buff.fujiedas_fury.remains<2
	{'Bloodthirst', 'buff(Fujieda\'s Fury)&buff(Fujieda\'s Fury).count<2'},
	
	--actions.single_target+=/execute,if=(artifact.juggernaut.enabled&(!buff.juggernaut.up||buff.juggernaut.remains<2))||buff.stone_heart.react
	{'Execute', '{buff(Juggernaut)||buff(Juggernaut).count<2}||buff(Stone Heart)'},
	
	--actions.single_target+=/rampage,if=rage=100&(target.health.pct>20||target.health.pct<20&!talent.massacre.enabled)||buff.massacre.react&buff.enrage.remains<1
	{'Rampage', 'rage=100&{target.health>20||{target.health<20&!talent(5,1)}||{buff(Massacre)&buff(Enrage).duration<1}}'},
	
	--actions.single_target+=/berserker_rage,if=talent.outburst.enabled&cooldown.odyns_fury.remains=0&buff.enrage.down
	{'Berserker Rage', 'talent(3,2)&spell(Odyn\'s Fury).cooldown=0&!buff(Enrage)'},
	
	--actions.single_target+=/dragon_roar,if=!cooldown.odyns_fury.remains<=10||cooldown.odyns_fury.remains<3
	{'Dragon Roar', '!spell(Odyn\'s Fury).cooldown<=10||spell(Odyn\'s Fury).cooldown<3'},
	
	--actions.single_target+=/odyns_fury,if=buff.battle_cry.up&buff.enrage.up
	{'Odyn\'s Fury', 'buff(Battle Cry)&buff(Enrage)'},
	
	--actions.single_target+=/rampage,if=buff.enrage.down&buff.juggernaut.down
	{'Rampage', '!buff(Enrage)&!buff(Juggernaut)'},
	
	--actions.single_target+=/furious_slash,if=talent.frenzy.enabled&(buff.frenzy.down||buff.frenzy.remains<=3)
	{'Furious Slash', 'talent(6,2)&{!buff(Frenzy)||buff(Frenzy).count<=3}'},
	
	--actions.single_target+=/raging_blow,if=buff.juggernaut.down&buff.enrage.up
	{'Raging Blow', '!buff(Juggernaut)&buff(Enrage)'},
	
	--actions.single_target+=/whirlwind,if=buff.wrecking_ball.react&buff.enrage.up
	{'Whirlwind', 'talent(3,1)&buff(Wrecking Ball)&buff(Enrage)'},
	
	--actions.single_target+=/execute,if=talent.inner_rage.enabled||!talent.inner_rage.enabled&rage>50
	{'Execute', 'talent(6,3)||{!talent(6,3)&rage>50}'},
	
	--actions.single_target+=/bloodthirst,if=buff.enrage.down
	{'Bloodthirst', '!buff(Enrage)'},
	
	--actions.single_target+=/raging_blow,if=buff.enrage.down
	{'Raging Blow', '!buff(Enrage)'},
	
	--actions.single_target+=/execute,if=artifact.juggernaut.enabled 
	--{'Execute', ''}, --not possible now ...?, because dont have artifact traits check function
	
	--actions.single_target+=/raging_blow
	{'Raging Blow'},
	
	--actions.single_target+=/bloodthirst
	{'Bloodthirst'},
	
	--actions.single_target+=/furious_slash
	{'Furious Slash'},
	
	--actions.single_target+=/call_action_list,name=bladestorm
	{Bladestorm},

	--actions.single_target+=/bloodbath,if=buff.frothing_berserker.up||(rage>80&!talent.frothing_berserker.enabled)
	{'Bloodbath', 'buff(Frothing Berserker)||{rage>80&!talent(5,2)}'}

}

local TwoTargets = {

	--actions.two_targets=whirlwind,if=buff.meat_cleaver.down
	{'Whirlwind', '!buff(Meat Cleaver)'},
	
	--actions.two_targets+=/call_action_list,name=bladestorm
	{Bladestorm},

	--actions.two_targets+=/rampage,if=buff.enrage.down||(rage=100&buff.juggernaut.down)||buff.massacre.up
	{'Rampage', '!buff(Enrage)||{rage=100&!buff(Juggernaut)}||buff(Massacre)'},
	
	--actions.two_targets+=/bloodthirst,if=buff.enrage.down
	{'Bloodthirst', '!buff(Enrage)'},
	
	--actions.two_targets+=/raging_blow,if=talent.inner_rage.enabled&spell_targets.whirlwind=2
	{'Raging Blow', 'talent(6,3)&player.area(8).enemies=2'},
	
	--actions.two_targets+=/whirlwind,if=spell_targets.whirlwind>2
	{'Whirlwind', 'player.area(8).enemies>2'},
	
	--actions.two_targets+=/dragon_roar
	{'Dragon Roar'},
	
	--actions.two_targets+=/bloodthirst
	{'Bloodthirst'},
	
	--actions.two_targets+=/whirlwind
	{'Whirlwind'}

}



local Keybinds = {

	-- Pause
	{'%pause', 'keybind(alt)'},
	
	--actions.movement=heroic_leap
	{'Heroic Leap', 'keybind(lcontrol)' , 'mouseover.ground'}
}

local inCombat = {

	{Keybinds},
	{_Xeer},
	--{Survival, 'player.health < 100'},
	--{Cooldowns, 'toggle(cooldowns)'},
	--{PreCombat},
	{Util},
	
	--actions+=/call_action_list,name=two_targets,if=spell_targets.whirlwind=2||spell_targets.whirlwind=3
	{TwoTargets, 'player.area(8).enemies=2||player.area(8).enemies=3'},
	
	--actions+=/call_action_list,name=aoe,if=spell_targets.whirlwind>3
	{AoE, 'player.area(8).enemies>3'},
	
	--actions+=/call_action_list,name=single_target
	{ST, {'target.range < 8', 'target.infront'}}
	
}

local outCombat = {

	{Keybinds},
	{PreCombat},
	
}

NeP.Engine.registerRotation(72, '[|cff'..Xeer.Interface.addonColor..'Xeer|r] WARRIOR - Fury', inCombat, outCombat, exeOnLoad, GUI)