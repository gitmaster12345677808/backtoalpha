

local S = core.get_translator("ethereal_bosses")


mobs:register_mob("ethereal_bosses:nature_guardian", {
--	nametag = "Nature Guardian",
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 4,
	damage = 8,
	hp_min = 80,
	hp_max = 80,
	armor = 80,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 2.0, 0.4},
	visual = "mesh",
	mesh = "natureguardian.b3d",
	visual_size = {x = 9, y = 9},
	--rotate = 180,
	textures = {
		{"roots_monster.png"},
	},
--	
	blood_texture = "bloood_nature.png",
	makes_footstep_sound = true,
	sounds = {
		--attack = "",
		--death = "",
	},

	pathfinding = 1,
	walk_velocity = 1,
	run_velocity = 5,
	jump_height = 2,
	stepheight = 1.1,
	floats = 0,
	view_range = 25,

	drops = {
		{name = "natureguardian:natureroots", chance = 2, min = 1, max = 1},
		--{name = "", chance = 5, min = 1, max = 1},
--		{name = "", chance = 3, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 20,
		walk_start = 30,
		walk_end = 50,
		run_start = 80,
		run_end = 100,
		punch_start = 110,
		punch_end = 15920,
	},
})





mobs:register_egg("ethereal_bosses:nature_guardian", S("Nature Guardian"), "natureguardian_egg.png", 0)

