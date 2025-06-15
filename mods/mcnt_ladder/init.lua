local function terrain(index)
	return "terrain.png^[sheet:16x16:" .. (index % 16) .. "," .. math.floor(index / 16)
end

local function block_sound(name)
	return 
end

minetest.register_node(":minecraft:ladder", {
	description = "Ladder",
	drawtype = "signlike",
	is_ground_content = false,
	tiles = { terrain(83) },
	inventory_image = terrain(83),
	wield_image = terrain(83),
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = true,
	climbable = false, -- manual simulation
	sounds = block_sound("wood"),
	node_box = {
		type = "wallmounted",
		wall_side = { -0.5, -0.5, -0.5, -7/16, 0.5, 0.5 },
	},
	selection_box = {
		type = "wallmounted",
		wall_side = { -0.5, -0.5, -0.5, -7/16, 0.5, 0.5 },
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3},

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then return itemstack end
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		if node.name == "minecraft:ladder" then return itemstack end
		if under.y ~= pointed_thing.above.y then return itemstack end
		return minetest.item_place_node(itemstack, placer, pointed_thing)
	end,
})

minetest.register_craft({
	output = "minecraft:ladder 3",
	recipe = {
		{"minecraft:stick", "", "minecraft:stick"},
		{"minecraft:stick", "minecraft:stick", "minecraft:stick"},
		{"minecraft:stick", "", "minecraft:stick"},
	}
})

-- Check if near ladder block in 3x3x3 area OR standing on ladder block below feet
local function is_near_ladder_or_standing_on_ladder(pos)
	local pos_round = vector.round(pos)
	
	-- Check 3x3x3 around player
	for dx = -1, 1 do
		for dy = -1, 1 do
			for dz = -1, 1 do
				local check_pos = {
					x = pos_round.x + dx,
					y = pos_round.y + dy,
					z = pos_round.z + dz,
				}
				local node_name = minetest.get_node(check_pos).name
				if node_name == "minecraft:ladder" then
					return true
				end
			end
		end
	end
	
	-- Check node right below player feet (y - 1)
	local below_pos = {x = pos_round.x, y = pos_round.y - 1, z = pos_round.z}
	local below_node = minetest.get_node(below_pos).name
	if below_node == "minecraft:ladder" then
		return true
	end
	
	return false
end

minetest.register_globalstep(function()
	for _, player in ipairs(minetest.get_connected_players()) do
		local pos = vector.add(player:get_pos(), {x=0, y=0.5, z=0})
		local vel = player:get_velocity()
		local ctrl = player:get_player_control()

		if is_near_ladder_or_standing_on_ladder(pos) then
			local new_y = 0
			if ctrl.jump or ctrl.up then
				new_y = 0.5  -- climb up fast
			else
				new_y = -0.5 -- slide down automatically
			end

			-- Set vertical velocity, keep horizontal velocity intact
			player:set_velocity({x = vel.x, y = new_y, z = vel.z})
			player:set_physics_override({gravity = 0, speed = 1})
		else
			player:set_physics_override({gravity = 1, speed = 1})
		end
	end
end)
