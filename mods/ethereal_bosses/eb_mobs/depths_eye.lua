
local S = core.get_translator("ethereal_bosses")

mobs:register_mob("ethereal_bosses:depthseye", {
	--nametag = "Depths Eye " ,
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 3,
	hp_min = 20,
	hp_max = 20,
	armor = 80,
	collisionbox = {-0.4, -0.1, -0.4, 0.4, 0.9, 0.4},
	visual = "mesh",
	mesh = "zoio_de_lula.b3d",
	visual_size = {x = 10, y = 10},
	textures = {
		{"zoio_de_lula.png"},
	},
	
	--blood_texture = "",
	--glow = 8,
	makes_footstep_sound = false,
	sounds = {
		random = "zoiodelulasound",
	},
	
	fly = true , 
	fly_in = "air",
	pathfinding = 1,
	walk_velocity = 1,
	run_velocity = 4,
	jump_height = 1,
	stepheight = 1.1,
	floats = 0,
	view_range = 15,
	drops = {
		
		{name = "ethereal_bosses:deye", chance = 2, min = 1, max = 1},
		
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 3,
	
	
	animation = {
	
		speed_run = 15,
		stand_start = 1,
		stand_end =40,
		walk_start = 60,
		walk_end = 80,
		run_start = 60,
		run_end = 80,
		--punch_start = 0,
		--punch_end = 0,
	},
	
	
	
})




mobs:register_egg("ethereal_bosses:depthseye", S("Depths Eye"), "zoi_de_lula_egg.png", 0)







