-- SOUND :
-- https://freesound.org/people/NicknameLarry/sounds/489901/ (CC0)

local S = core.get_translator("ethereal_bosses")



mobs:register_mob("ethereal_bosses:heated", {
	--nametag = "Heated Boss",
	type = "monster",
	passive = false,
	attack_npcs = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 8,
	damage = 20,
	hp_min = 1300,
	hp_max = 1300,
	armor = 80,
	friendly_fire = true,
	collisionbox = {-1.0, -0.5, -1.0, 1.0, 2.0, 1.0},
	visual = "mesh",
	visual_size = {x = 10, y = 10},
	mesh = "heated2.b3d",
	--rotate = 180,
	textures = {
		{"heated2.png"},
	},
	glow = 8,
	blood_texture = "default_obsidian_shard.png",
	makes_footstep_sound = true,
	sounds = {
		random = "monsterhot",
--		attack = "monster",
--		death = "",
	},
	fly = true,
	fly_in = "air",
	pathfinding = 1,
	walk_velocity = 2,
	run_velocity = 4,
	jump_height = 2,
	stepheight = 3.0,
	floats = 0,
	view_range = 35,
	drops = {
		{name = "ethereal_bosses:flaming_sword", chance = 1, min = 1, max = 1},
		{name = "ebitems:heated_trophy", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 30,
		speed_punch = 50,
		stand_start = 1,
		stand_end = 20,
		walk_start = 30,
		walk_end = 70,
		run_start = 80,
		run_end = 100,
		punch_start = 110,
		punch_end = 124,
	},

	
	on_die = function(self, pos)
		
	end
})




mobs:register_egg("ethereal_bosses:heated", S("Heated"), "eggsheated.png", 1)




