
local S = core.get_translator("ethereal_bosses")

mobs:register_mob("ethereal_bosses:icemonster", {
--	nametag = "Ice Monster",
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	--owner_loyal = true,
	pathfinding = true,
	reach = 3,
	damage = 15,
	hp_min = 80,
	hp_max = 80,
	armor = 80,
	collisionbox = {-0.4, -0.8, -0.4, 0.4,1.0, 0.4},
	visual = "mesh",
	visual_size = {x = 16, y = 16},
	mesh = "ice_monster_guardian.b3d",
	--rotate = 180,
	textures = {
		{"ice_monster_guardian.png"},
	},
--	glow = 4,
	blood_texture = "default_ice.png",
	makes_footstep_sound = true,
	sounds = {
		--attack = "",
		--death = "",
	},

	pathfinding = 1,
	walk_velocity = 1,
	run_velocity = 5,
	jump_height = 4,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,

	drops = {
--		{name = "", chance = 2, min = 1, max = 1},
--		{name = "", chance = 5, min = 1, max = 1},
--		{name = "", chance = 3, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 0,
		walk_start = 20,
		walk_end = 60,
		run_start = 70,
		run_end = 90,
		punch_start = 100,
		punch_end = 139,
	},
})


--[[
mobs:spawn({
	name = "icemonster:icemonster",
	nodes = ,
	min_light = 0,
	max_light = 14,
	chance = 6000,
	--min_height = 0,
	--max_height = 200,
	max_height = 200,
})
]]

mobs:register_egg("ethereal_bosses:icemonster", S("Ice Monster"), "ice_castle_blue.png", 1)



