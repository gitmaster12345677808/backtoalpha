local S = core.get_translator("ethereal_bosses")

--=============================== MUSHROOM TOOLS : =============================================================================

core.register_tool("ethereal_bosses:pick_mushroom", {
	description = S("Mushroom Pickaxe"),
	inventory_image = "mushroom_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})



core.register_tool("ethereal_bosses:shovel_mushroom", {
	description = S("Mushroom Shovel"),
	inventory_image = "mushroom_shovel.png",
	wield_image = "mushroom_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})


core.register_tool("ethereal_bosses:axe_mushroom", {
	description = S("Mushroom Axe"),
	inventory_image = "mushroom_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})



core.register_tool("ethereal_bosses:sword_mushroom", {
	description = S("Mushroom Sword"),
	inventory_image = "mushroom_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})





--========================= NATURE TOOLS : ===========================================================================
-- Sound whip : https://freesound.org/people/CGEffex/sounds/93100/

core.register_tool("ethereal_bosses:naturewhip", {
	description = S("Nature Whip"),
	inventory_image = "Nature_Whip.png",
	range = 15,
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=3,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=4, knockback=2},
	},
	sound = {
	breaks = "default_tool_breaks",
	punch_use = "whip",

	},
})



core.register_tool("ethereal_bosses:naturerod", {
	description = S("Nature Rod"),
	wield_scale = {x = 1.5, y = 3.1, z = 1.5},
	inventory_image = "Nature_Rod.png",
	range = 15,
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=3,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4, knockback=2},
	},
	sound = {
	breaks = "default_tool_breaks"
	},
})



-- Obsidian Sword (Agora item de troca com Elder)

core.register_tool("ethereal_bosses:sword_obsidian", {
	wield_scale = {x = 1.5, y = 1.5, z = 2.5},
	description = S("Obsidian Sword"),
	inventory_image = "obsidian_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {[1] = 1.90, [2] = 0.90, [3] = 0.30},
				uses = 80,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 9},
	},
	
	sound = {
	--breaks = "default_tool_breaks",
	punch_use = "swoosh1",
	punch_use_air ="swoosh1",
	},
	
	groups = {sword = 1}
})


-- ESPADA FLAMEJANTE :

core.register_tool("ethereal_bosses:flaming_sword", {
	wield_scale = {x = 1.5, y = 1.5, z = 2.5},
	description = S("Flaming Sword"),
	inventory_image = "flaming_sword.png",
	light =12 ,
	

	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {[1] = 1.90, [2] = 0.90, [3] = 0.30},
				uses = 80,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 14 , fire=1},
	},
	
	
	
	sound = {
	--breaks = "default_tool_breaks",
	punch_use = "swoosh1",
	punch_use_air ="swoosh1",
	},
	
	groups = {sword = 1},
	
	  

	

})


