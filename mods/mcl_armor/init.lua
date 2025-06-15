local S = minetest.get_translator("mcla_armor")

dofile(minetest.get_modpath(minetest.get_current_modname()).."/armor.lua")

-- Regisiter Head Armor

minetest.register_tool(":mcla:iron_helmet", {
	description = S("Iron Helmet"),
	inventory_image = "items.png^[sheet:16x16:2,0",
	groups = { armor_head=1, mcla_armor_points=2, mcla_armor_uses=166 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

minetest.register_tool(":mcla:gold_helmet", {
	description = S("Golden Helmet"),
	inventory_image = "items.png^[sheet:16x16:4,0",
	groups = { armor_head=1, mcla_armor_points=2, mcla_armor_uses=78 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

minetest.register_tool(":mcla:diamond_helmet",{
	description = S("Diamond Helmet"),
	inventory_image = "items.png^[sheet:16x16:3,0",
	groups = { armor_head=1, mcla_armor_points=3, mcla_armor_uses=364, mcla_armor_toughness=2 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

-- Regisiter Torso Armor



minetest.register_tool(":mcla:iron_chestplate", {
	description = S("Iron Chestplate"),
	inventory_image = "items.png^[sheet:16x16:2,1",
	groups = { armor_torso=1, mcla_armor_points=6, mcla_armor_uses=241 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

minetest.register_tool(":mcla:gold_chestplate", {
	description = S("Golden Chestplate"),
	inventory_image = "items.png^[sheet:16x16:4,1",
	groups = { armor_torso=1, mcla_armor_points=5, mcla_armor_uses=113 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

minetest.register_tool(":mcla:diamond_chestplate",{
	description = S("Diamond Chestplate"),
	inventory_image = "items.png^[sheet:16x16:3,1",
	groups = { armor_torso=1, mcla_armor_points=8, mcla_armor_uses=529, mcla_armor_toughness=2 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

-- Regisiter Leg Armor



minetest.register_tool(":mcla:iron_leggings", {
	description = S("Iron Leggings"),
	inventory_image = "items.png^[sheet:16x16:2,2",
	groups = { armor_legs=1, mcla_armor_points=5, mcla_armor_uses=226 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

minetest.register_tool(":mcla:gold_leggings", {
	description = S("Golden Leggings"),
	inventory_image = "items.png^[sheet:16x16:4,2",
	groups = { armor_legs=1, mcla_armor_points=3, mcla_armor_uses=106 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

minetest.register_tool(":mcla:diamond_leggings",{
	description = S("Diamond Leggings"),
	inventory_image = "items.png^[sheet:16x16:3,2",
	groups = { armor_legs=1, mcla_armor_points=6, mcla_armor_uses=496, mcla_armor_toughness=2 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

-- Regisiter Boots


minetest.register_tool(":mcla:iron_boots", {
	description = S("Iron Boots"),
	inventory_image = "items.png^[sheet:16x16:2,3",
	groups = {armor_feet=1, mcla_armor_points=2, mcla_armor_uses=196 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

minetest.register_tool(":mcla:gold_boots", {
	description = S("Golden Boots"),
	inventory_image = "items.png^[sheet:16x16:4,3",
	groups = {armor_feet=1, mcla_armor_points=1, mcla_armor_uses=92 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

minetest.register_tool(":mcla:diamond_boots",{
	description = S("Diamond Boots"),
inventory_image = "items.png^[sheet:16x16:3,3",
	groups = {armor_feet=1, mcla_armor_points=3, mcla_armor_uses=430, mcla_armor_toughness=2 },

	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})

-- Register Craft Recipies

local craft_ingreds = {
	
	iron = "minecraft:iron_ingot",
	gold = "minecraft:gold_ingot",
	diamond = "minecraft:diamond",
}

for k, v in pairs(craft_ingreds) do
	-- material
	if v ~= nil then
		minetest.register_craft({
			output = "mcla:"..k.."_helmet",
			recipe = {
				{v, v, v},
				{v, "", v},
				{"", "", ""},
			},
		})
		minetest.register_craft({
			output = "mcla:"..k.."_chestplate",
			recipe = {
				{v, "", v},
				{v, v, v},
				{v, v, v},
			},
		})
		minetest.register_craft({
			output = "mcla:"..k.."_leggings",
			recipe = {
				{v, v, v},
				{v, "", v},
				{v, "", v},
			},
		})
		minetest.register_craft({
			output = "mcla:"..k.."_boots",
			recipe = {
				{v, "", v},
				{v, "", v},
			},
		})
	end
end

