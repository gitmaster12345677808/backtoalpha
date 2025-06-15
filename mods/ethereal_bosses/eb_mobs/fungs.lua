

local S = core.get_translator("ethereal_bosses")

mobs:register_mob("ethereal_bosses:fungs", {
--	nametag = "Fungs",
	type = "npc",
	passive = true,
	attack_type = "dogfight",
	owner_loyal = true,
	pathfinding = true,
	reach = 2,
	damage = 5,
	hp_min = 80,
	hp_max = 80,
	armor = 80,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	visual_size = {x = 9, y = 9},
	mesh = "fungs.b3d",
	--rotate = 180,
	textures = {
		{"fungs.png"},
	},
	--blood_texture = ".png",
	makes_footstep_sound = true,
	sounds = {
		--attack = "",
		--death = "",
		random = "monster1",
	},

	pathfinding = 1,
	walk_velocity = 5,
	run_velocity = 7,
	jump_height = 2,
	stepheight = 1.1,
	floats = 0,
	view_range = 45,
	owner = "", --
	order = "follow",--

	drops = {
		-- {name = "flowers:mushroom_brown", chance = 1, min = 1, max = 1},
--		{name = "", chance = 5, min = 1, max = 1},
--		{name = "", chance = 3, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 1,
		walk_start = 30,
		walk_end = 49,
		run_start = 80,
		run_end = 99,
--		punch_start = 0,
--		punch_end = 0,
	},

	follow = {
		"ethereal_bosses:rotten_wood",
	},

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 1, true, true) then 			
	        	--self.object:set_animation({x=110, y=150},15, 0, true)
	        	--[[
	        	minetest.sound_play("...", {   
                gain = 0.5,
            	})

			 	]]

			return 
		end


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
				self.order = "follow"
				mobs:set_animation(self, "walk")

			end
		end

					-- Dance , Dance :

					if clicker:get_wielded_item():get_name() == "ethereal_bosses:rotten_wood" then

					local inv = clicker:get_inventory()
					local tool = clicker:get_wielded_item()
					local item = tool:get_name()

					inv:remove_item("main", "ethereal_bosses:rotten_wood")

					self.object:set_animation({x=110, y=149},25, 0, true)

					minetest.after(0.8, function()
					mobs:set_animation(self, "stand")
					end)

				end

	end,

})






mobs:register_egg("ethereal_bosses:fungs", S("Fungs"), "fungs_egg.png", 0)



