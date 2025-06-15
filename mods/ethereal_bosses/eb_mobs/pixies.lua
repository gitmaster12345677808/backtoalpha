


-- ============================================= PIXIES BLUE =============================================================
mobs:register_mob("ethereal_bosses:pixies_blue", {
	--nametag = "Pixies" ,
	type = "npc",
	passive = true,
	attack_type = "dogfight",
	owner_loyal = true,
	pathfinding = true,
	reach = 1,
	damage = 3,
	hp_min = 80,
	hp_max = 80,
	armor = 100,
	collisionbox = {-0.3, -0.5, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	visual_size = {x = 7, y = 7},
	mesh = "pixies.b3d",
	--rotate = 180,
	textures = {
		{"pixies.png"},
	},

	makes_footstep_sound = false,

	--blood_texture = "",
	sounds = {
		random = "pixies",
		--death = "",
	},

	fly = true , 
	fly_in = "air",
	pathfinding = 1,
	walk_velocity = 2,
	run_velocity = 4,
	jump_height = 3,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	
	drops = {
	
		--{name = " ", chance = 3, min = 0, max = 1},
		
	},

	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	glow =8,
	owner = "", --
	order = "follow",

	animation = {
		speed_normal = 30,
		stand_start = 1,
		stand_end = 8,
		fly_start = 1,			
		fly_end = 8,
		walk_start = 1,
		walk_end = 8,
		run_start =1,
		run_end = 8,
		
	},
	
	follow = {
		 "ethereal_bosses:nectar", 
	
		
	},
	
	
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 50, 50, 90, false, nil) then return end

		-- by right-clicking owner can switch between staying and walking
		if self.owner and self.owner == clicker:get_player_name() then

			if self.order ~= "stand" then
				self.order = "stand"
				self.state = "stand"
				self.object:set_velocity({x = 0, y = 0, z = 0})
				mobs:set_animation(self, "stand")
			else
				self.order = ""
				mobs:set_animation(self, "fly")
			end
		end

		if not clicker:is_player() then
      return
    end

end



})






mobs:register_egg("ethereal_bosses:pixies_blue", "Pixies Blue", "pixies_blue_egg.png", 0)

-- ======================================================================================================================
-- ============================================= PIXIES RED =============================================================
mobs:register_mob("ethereal_bosses:pixies_red", {
	--nametag = "Pixies Red" ,
	type = "npc",
	passive = true,
	attack_type = "dogfight",
	owner_loyal = true,
	pathfinding = true,
	reach = 1,
	damage = 2,
	hp_min = 80,
	hp_max = 80,
	armor = 100,
	collisionbox = {-0.3, -0.5, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	visual_size = {x = 7, y = 7},
	mesh = "pixies.b3d",
	--rotate = 180,
	textures = {
		{"pixies_vermelho.png"},
	},

	makes_footstep_sound = false,
	
	sounds = {
		random = "pixies",
		--death = "",
	},

	fly = true , 
	fly_in = "air",
	walk_velocity = 2,
	run_velocity = 4,
	jump_height = 3,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	glow =8,
	owner = "", --
	order = "follow",

	drops = {
	
		--{name = " ", chance = 3, min = 0, max = 1},
		
	},
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	
	animation = {
		speed_normal = 30,
		stand_start = 1,
		stand_end = 8,
		fly_start = 1,			
		fly_end = 8,
		walk_start = 1,
		walk_end = 8,
		run_start =1,
		run_end = 8,
		
	},

	follow = {
		 "ethereal_bosses:nectar",  
		
		
	},
	
	
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 50, 50, 90, false, nil) then return end

		-- by right-clicking owner can switch between staying and walking
		if self.owner and self.owner == clicker:get_player_name() then

			if self.order ~= "stand" then
				self.order = "stand"
				self.state = "stand"
				self.object:set_velocity({x = 0, y = 0, z = 0})
				mobs:set_animation(self, "stand")
			else
				self.order = ""
				mobs:set_animation(self, "fly")
			end
		end

		if not clicker:is_player() then
      return
    end

end

	
	

})



mobs:register_egg("ethereal_bosses:pixies_red", "Pixies Red", "pixies_red_egg.png", 0)

-- ========================================================================================================================
-- ============================================= PIXIES GREEN =============================================================
mobs:register_mob("ethereal_bosses:pixies_green", {
	--nametag = "Pixies Green" ,
	type = "npc",
	passive = true,
	attack_type = "dogfight",
	owner_loyal = true,
	pathfinding = true,
	reach = 1,
	damage = 2,
	hp_min = 80,
	hp_max = 80,
	armor = 100,
	collisionbox = {-0.3, -0.5, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	visual_size = {x = 7, y = 7},
	mesh = "pixies.b3d",
	--rotate = 180,
	textures = {
		{"pixies_verde.png"},
	},

	makes_footstep_sound = false,
	
	sounds = {
		random = "pixies",
		--death = "",
	},

	fly = true , 
	fly_in = "air",
	walk_velocity = 2,
	run_velocity = 4,
	jump_height = 3,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	glow =8,
	owner = "", --
	order = "follow",

	drops = {
	
		--{name = " ", chance = 3, min = 0, max = 1},
		
	},

	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,

	animation = {
		speed_normal = 30,
		stand_start = 1,
		stand_end = 8,
		fly_start = 1,			
		fly_end = 8,
		walk_start = 1,
		walk_end = 8,
		run_start =1,
		run_end = 8,
		
	},


	follow = {
	
		 "ethereal_bosses:nectar",  		
	},
	
	
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 50, 50, 90, false, nil) then return end

		-- by right-clicking owner can switch between staying and walking
		if self.owner and self.owner == clicker:get_player_name() then

			if self.order ~= "stand" then
				self.order = "stand"
				self.state = "stand"
				self.object:set_velocity({x = 0, y = 0, z = 0})
				mobs:set_animation(self, "stand")
			else
				self.order = ""
				mobs:set_animation(self, "fly")
			end
		end

		if not clicker:is_player() then
      return
    end

end

	
	


})









mobs:register_egg("ethereal_bosses:pixies_green", "Pixies Green", "pixies_green_egg.png", 0)

-- ==============================================================================================================

