
local S = core.get_translator("ethereal_bosses")

-- SOUND :
-- https://freesound.org/people/Volvion/sounds/609780/ (CC0)
-- https://freesound.org/people/newagesoup/sounds/348244/ (CC0)

mobs:register_mob("ethereal_bosses:crazymushroom", {
--	stay_near = {"ethereal:mushroom_dirt", 10},
	--nametag = "Crazy Mushroom Boss" ,
	type = "monster",
	passive = false,
	attack_npcs = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 8,
	damage = 18,
--	knockback = 2,
	hp_min = 1100,
	hp_max = 1100,
	armor = 80,
	collisionbox = {-0.7, -0.7, -0.7, 0.7,3.5, 0.7},
	visual = "mesh",
	visual_size = {x = 13, y = 13},
	mesh = "crazymushroom2.b3d",
	--rotate = 180,
	textures = {
		{"crazymushrrom2.png"},
	},
--	glow = 2,
	--blood_texture = "ethereal_mushroom_sapling.png",
	makes_footstep_sound = true,
	sounds = {
		random = "crazyman",
--		attack = "",
--		death = "",
	},
    
	pathfinding = 1,
	walk_velocity = 2,
	run_velocity = 4,
	jump_height = 5,
	stepheight = 3.0,
	floats = 0,
	view_range = 35,
	drops = {
		-- {name = "ethereal_bosses:glove_glove", chance = 1, min = 1, max = 1},
		{name = "ethereal_bosses:crazymushrrom_trophy", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 20,
		speed_run = 20,
		stand_start = 0,
		stand_end = 0,
		walk_start = 20,
		walk_end = 60,
		run_start = 70,
		run_end = 90,
		punch_start = 100,
		punch_end = 120,
	},


	--do_custom = function(self, dtime)
	--end,

	
	
	on_die = function(self, pos) -- POSIÇÃO
		
	end
})





mobs:register_egg("ethereal_bosses:crazymushroom",S("Crazy Mushroom"),"ethereal_bosses_inv_glove_glove.png", 1)



