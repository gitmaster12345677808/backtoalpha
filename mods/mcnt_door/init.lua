-- our API object
doors = {}

doors.registered_doors = {}

-- returns an object to a door object or nil
function doors.get(pos)
	local node_name = minetest.get_node(pos).name
	if doors.registered_doors[node_name] then
		return {
			pos = pos,
			open = function(self, player)
				if self:state() then
					return false
				end
				return doors.door_toggle(self.pos, nil, player)
			end,
			close = function(self, player)
				if not self:state() then
					return false
				end
				return doors.door_toggle(self.pos, nil, player)
			end,
			toggle = function(self, player)
				return doors.door_toggle(self.pos, nil, player)
			end,
			state = function(self)
				local state = minetest.get_meta(self.pos):get_int("state")
				return state % 2 == 1
			end
		}
	end
end

minetest.register_node(":minecraft:hidden", {
	description = "Hidden Door Segment",
	drawtype = "airlike",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	pointable = false,
	diggable = false,
	buildable_to = false,
	floodable = false,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_blast = function() end,
	collision_box = {
		type = "fixed",
		fixed = {-15/32, 13/32, -15/32, -13/32, 1/2, -13/32},
	},
})

local transform = {
	{
		{v = "_a", param2 = 3},
		{v = "_a", param2 = 0},
		{v = "_a", param2 = 1},
		{v = "_a", param2 = 2},
	},
	{
		{v = "_c", param2 = 1},
		{v = "_c", param2 = 2},
		{v = "_c", param2 = 3},
		{v = "_c", param2 = 0},
	},
	{
		{v = "_b", param2 = 1},
		{v = "_b", param2 = 2},
		{v = "_b", param2 = 3},
		{v = "_b", param2 = 0},
	},
	{
		{v = "_d", param2 = 3},
		{v = "_d", param2 = 0},
		{v = "_d", param2 = 1},
		{v = "_d", param2 = 2},
	},
}

function doors.door_toggle(pos, node, clicker)
	local meta = minetest.get_meta(pos)
	node = node or minetest.get_node(pos)
	local def = minetest.registered_nodes[node.name]
	local name = def.door.name

	local state = meta:get_string("state")
	if state == "" then
		if node.name:sub(-2) == "_b" then
			state = 2
		else
			state = 0
		end
	else
		state = tonumber(state)
	end

	local old_state = state

	if state % 2 == 1 then
		state = state - 1
	else
		state = state + 1
	end

	local dir = node.param2

	if not transform[state + 1] or not transform[state + 1][dir + 1] then
		return false
	end

	minetest.swap_node(pos, {
		name = name .. transform[state + 1][dir + 1].v,
		param2 = transform[state + 1][dir + 1].param2
	})
	meta:set_int("state", state)

	-- ✅ Play sound
	if def.door and def.door.sounds then
		local sound_name = def.door.sounds[state % 2 + 1]
		if sound_name then
			minetest.sound_play(sound_name, {
				pos = pos,
				gain = 0.3,
				max_hear_distance = 10
			}, true)
		end
	end

	return true
end

local function on_place_node(place_to, newnode,
	placer, oldnode, itemstack, pointed_thing)
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		local place_to_copy = vector.new(place_to)
		local newnode_copy = table.copy(newnode)
		local oldnode_copy = table.copy(oldnode)
		local pointed_thing_copy = {
			type  = pointed_thing.type,
			above = vector.new(pointed_thing.above),
			under = vector.new(pointed_thing.under),
			ref   = pointed_thing.ref,
		}
		callback(place_to_copy, newnode_copy, placer,
			oldnode_copy, itemstack, pointed_thing_copy)
	end
end

function doors.register(name, def)
	minetest.register_craftitem(":" .. name, {
		description = def.description,
		inventory_image = def.inventory_image,
		groups = table.copy(def.groups),
		stack_max = 1,
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then return itemstack end

			local pos
			local node = minetest.get_node(pointed_thing.under)
			local pdef = minetest.registered_nodes[node.name]

			if pdef and pdef.on_rightclick and
					not (placer and placer:is_player() and
					placer:get_player_control().sneak) then
				return pdef.on_rightclick(pointed_thing.under,
						node, placer, itemstack, pointed_thing)
			end

			if pdef and pdef.buildable_to then
				pos = pointed_thing.under
			else
				pos = pointed_thing.above
				node = minetest.get_node(pos)
				pdef = minetest.registered_nodes[node.name]
				if not pdef or not pdef.buildable_to then
					return itemstack
				end
			end

			local above = {x = pos.x, y = pos.y + 1, z = pos.z}
			local top_node = minetest.get_node_or_nil(above)
			local topdef = top_node and minetest.registered_nodes[top_node.name]
			if not topdef or not topdef.buildable_to then return itemstack end

			local dir = placer and minetest.dir_to_facedir(placer:get_look_dir()) or 0
			local ref = {
				{x = -1, y = 0, z = 0},
				{x = 0, y = 0, z = 1},
				{x = 1, y = 0, z = 0},
				{x = 0, y = 0, z = -1},
			}

			local aside = vector.add(pos, ref[dir + 1])
			local state = 0
			if minetest.get_item_group(minetest.get_node(aside).name, "door") == 1 then
				state = 2
				minetest.set_node(pos, {name = name .. "_b", param2 = dir})
				minetest.set_node(above, {name = "minecraft:hidden", param2 = (dir + 3) % 4})
			else
				minetest.set_node(pos, {name = name .. "_a", param2 = dir})
				minetest.set_node(above, {name = "minecraft:hidden", param2 = dir})
			end

			local meta = minetest.get_meta(pos)
			meta:set_int("state", state)

			if not minetest.is_creative_enabled(placer:get_player_name()) then
				itemstack:take_item()
			end

			on_place_node(pos, minetest.get_node(pos), placer, node, itemstack, pointed_thing)

			return itemstack
		end
	})

	def.inventory_image = nil

	if def.recipe then
		minetest.register_craft({
			output = name,
			recipe = def.recipe,
		})
	end

	def.recipe = nil
	def.groups.not_in_creative_inventory = 1
	def.groups.door = 1
	def.drop = name
	def.door = {
		name = name,
		sounds = def.sounds or { "door_close", "door_open" }
	}

	if not def.on_rightclick then
		def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			doors.door_toggle(pos, node, clicker)
			return itemstack
		end
	end

	def.after_dig_node = function(pos, node, meta, digger)
		minetest.remove_node({x = pos.x, y = pos.y + 1, z = pos.z})
		minetest.check_for_falling({x = pos.x, y = pos.y + 1, z = pos.z})
	end

	def.on_rotate = function(pos, node, user, mode, new_param2)
		return false
	end

	def.on_destruct = function(pos)
		minetest.remove_node({x = pos.x, y = pos.y + 1, z = pos.z})
	end

	def.drawtype = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.sunlight_propagates = true
	def.walkable = true
	def.is_ground_content = false
	def.buildable_to = false
	def.selection_box = {type = "fixed", fixed = {-1/2,-1/2,-1/2,1/2,3/2,-5/16}}
	def.collision_box = {type = "fixed", fixed = {-1/2,-1/2,-1/2,1/2,3/2,-5/16}}
	def.use_texture_alpha = "clip"
	def.sounds = block_sound('wood')

	def.mesh = "mcnt_door_a.obj"
	minetest.register_node(":" .. name .. "_a", def)

	def.mesh = "mcnt_door_b.obj"
	minetest.register_node(":" .. name .. "_b", def)

	def.mesh = "mcnt_door_a2.obj"
	minetest.register_node(":" .. name .. "_c", def)

	def.mesh = "mcnt_door_b2.obj"
	minetest.register_node(":" .. name .. "_d", def)

	doors.registered_doors[name .. "_a"] = true
	doors.registered_doors[name .. "_b"] = true
	doors.registered_doors[name .. "_c"] = true
	doors.registered_doors[name .. "_d"] = true
end

doors.register("minecraft:door", {
	description = "Wooden Door",
	inventory_image = "items.png^[sheet:16x16:11,2",
	tiles = {{ name = "terrain.png", backface_culling = true }},
	groups = {node = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	recipe = {
		{"minecraft:plank", "minecraft:plank"},
		{"minecraft:plank", "minecraft:plank"},
		{"minecraft:plank", "minecraft:plank"},
	},
	-- ✅ Custom sound files
	sounds = {
		"door_close",  -- close.ogg
		"door_open"    -- open.ogg
	}
})
 