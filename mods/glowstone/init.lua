-- Glowstone toggle (set to false to disable glowstone)
local glowstone_enabled = true

if not glowstone_enabled then
	minetest.log("action", "[custom_glowstone] Glowstone is disabled via config.")
	return
end

-- Glowstone glass sounds
local glass_sounds = {
	"glass1",
	"glass2",
	"glass3"
}
local glass_sound_index = 1

-- Register Glowstone Node
minetest.register_node("glowstone:glowstone", {
	description = "Glowstone",
	tiles = {"glowstone.png"},
	is_ground_content = false,
	light_source = 7,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky = 2, oddly_breakable_by_hand = 1},
	sounds = {
		footstep = {name = "stone", gain = 0.4},
		dig = {name = "stone", gain = 0.5},
		-- 'dug' is handled manually in on_dig
	},

	-- Custom dig sound handler
	on_dig = function(pos, node, digger)
		-- Play cycling glass sounds like Minecraft
		local sound_to_play = glass_sounds[glass_sound_index]
		minetest.sound_play(sound_to_play, {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 16,
		})

		-- Cycle to next sound
		glass_sound_index = glass_sound_index + 1
		if glass_sound_index > #glass_sounds then
			glass_sound_index = 1
		end

		-- Proceed with normal digging
		minetest.node_dig(pos, node, digger)
	end,
})

-- Crafting recipe for Glowstone
minetest.register_craft({
	output = "glowstone:glowstone",
	recipe = {
		{"", "minecraft:torch", ""},
		{"minecraft:torch", "minecraft:glass", "minecraft:torch"},
		{"", "minecraft:torch", ""}
	}
})

