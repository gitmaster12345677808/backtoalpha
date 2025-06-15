-- SOUNDS :
-- https://freesound.org/people/MadamVicious/sounds/218185/ (CC0)
-- https://freesound.org/people/satchdev/sounds/325411/ (CC0)
-- https://freesound.org/people/MadamVicious/sounds/347339/  (CC0)

local S = core.get_translator("ethereal_bosses")


local last_part = 0


mobs:register_mob("ethereal_bosses:frostyqueen", {
	--nametag = "Frosty Queen Boss",
	type = "monster",
	passive = false,
	attack_npcs = false,
	--attack_type = "shoot",
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 2, 
	dogshoot_count2_max = 2, 
	shoot_interval = 15,
	shoot_offset = 1.5,
	arrow = "ethereal_bosses:snowflake",
	pathfinding = true,
	reach = 3,
	damage = 8,
	hp_min = 1500,
	hp_max = 1500,
	armor = 80,
	collisionbox = {-0.4, -0.2, -0.4, 0.4, 1.5, 0.4},
	visual = "mesh",
	visual_size = {x = 9, y = 9},
	mesh = "frostyqueen2.b3d",
	--rotate = 180,
	textures = {
		{"frosty_queen_2.png"},
	},
	glow = 8,
	blood_texture = "fqp.png",
	makes_footstep_sound = true,
	sounds = {
		random = "girlsmile",
		--damage = "golpeada",
		attack = "attack_range_queen",
		death = "gameover",
		
	},

--	fly = true,
--	fly_in = "air",
	walk_velocity = 0,
	run_velocity = 0,
	jump_height = 1,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	knock_back = false,
	drops = {
		
		  {name = "ethereal_bosses:frostyqueen_trophy", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	
	animation = {
		speed_run = 15,
		stand_start = 1,
		stand_end = 20,
		walk_start = 30,
		walk_end = 50,
		run_start = 30,
		run_end = 50,
		shoot_start =60,
		shoot_end = 90,
	},

	
	do_custom = function(self, dtime)

    	         local current_time = minetest.get_us_time()
		 if current_time - last_part >= 2 * (10^6)  then 
		 last_part = current_time
		
		 local pos = self.object:get_pos()
		 	
		 
		 minetest.add_particlespawner({
		    amount = 10, 
		    time = 1, 
		    
		    minpos = {x = pos.x + 0.7 , y = pos.y, z = pos.z + 0.7},
		    maxpos = {x = pos.x - 0.7, y = pos.y + 2, z = pos.z - 0.7},
		    
		    minvel = {x = 0, y = 1, z = 0}, 
		    maxvel = {x = 0, y = 1, z = 0}, 
		    
		    minacc = {x = -1, y = -1, z = -1},
		    maxacc = {x = 1, y = 1, z = 1}, 
		    
		    minexptime = 1, 
		    maxexptime = 1,
		     
		    minsize = 2,
		    maxsize = 3,
		    
		    collisiondetection = false,
		    vertical = true, 
		    texture = "fqp.png", 
		    glow = 4, 
		})
		
		end
		
		
    
	end,
	

	on_die = function(self, pos) 
		
	end
})





-- ARROW -----------------------------------------------------------
mobs:register_arrow("ethereal_bosses:snowflake", {
	visual = "sprite",
	visual_size = {x = 1.5, y = 1.5},
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	velocity = 18,
	textures = {"fqp.png"},
	tail = 1,
	tail_texture = "fqp.png",
	tail_size = 10,
	glow = 4,
	expire = 0.25,
  
	on_step = function(self, dtime, moveresult)
	
		local current_velocity = self.object:get_velocity()
		local pos = self.object:get_pos()
		
		self.object:set_velocity({
			x = current_velocity.x,
			y = current_velocity.y - 0.3,
			z = current_velocity.z
		})
		
		 local node = minetest.get_node_or_nil(pos)
		 
		 if node and node.name ~= "air" then
		 pos.y = pos.y + 0.5
		 minetest.add_entity(pos, "ethereal_bosses:icemonster")
		 minetest.sound_play("attack_range_queen", {pos = pos, gain = 0.5})
		 
		 self.object:remove()
		 
		 end
	end,

})





mobs:register_egg("ethereal_bosses:frostyqueen", S("Frosty Queen"), "eggsfrostyqueen.png", 1)



