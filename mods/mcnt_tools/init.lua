dofile(minetest.get_modpath('mcnt_tools')..'/recipes.lua')

minetest.register_tool(":minecraft:wooden_pickaxe", {
	description = "Wooden Pickaxe",
	inventory_image = "items.png^[sheet:16x16:0,6",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 0,
		groupcaps = {
			cracky = {
				maxlevel = 2, -- Can mine stone, coal ore, but not iron ore
				uses = 33,
				times = { [2]=1.50, [3]=0.75 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 17,
	},
})
minetest.register_tool(":minecraft:stone_pickaxe", {
	description = "Stone Pickaxe",
	inventory_image = "items.png^[sheet:16x16:1,6",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			cracky = {
				maxlevel = 2, -- Can mine iron ore, but not obsidian
				uses = 132,
				times = { [1]=1.25, [2]=0.75, [3]=0.40 }
			},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 66,
	},
})
minetest.register_tool(":minecraft:iron_pickaxe", {
	description = "Iron Pickaxe",
	inventory_image = "items.png^[sheet:16x16:2,6",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 2,
		groupcaps = {
			cracky = {
				maxlevel = 3, -- Can mine obsidian
				uses = 251,
				times = { [1]=0.85, [2]=0.50, [3]=0.35 }
			},
		},
		damage_groups = {fleshy=6},
		punch_attack_uses = 126,
	},
})
minetest.register_tool(":minecraft:super_pickaxe", {
	description = "Super Pickaxe",
	inventory_image = "items.png^[sheet:16x16:2,6",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 5,
		groupcaps = {
			cracky = {
				maxlevel = 5,
				uses = 1000,
				times = { [1]=0.20, [2]=0.20, [3]=0.20, [4]=0.20, [5]=0.20 }
			},
			crumbly = {
				maxlevel = 5,
				uses = 1000,
				times = { [1]=0.20, [2]=0.20, [3]=0.20, [4]=0.20, [5]=0.20 }
			},
			choppy = {
				maxlevel = 5,
				uses = 1000,
				times = { [1]=0.20, [2]=0.20, [3]=0.20, [4]=0.20, [5]=0.20 }
			},
			snappy = {
				maxlevel = 5,
				uses = 1000,
				times = { [1]=0.20, [2]=0.20, [3]=0.20, [4]=0.20, [5]=0.20 }
			},
		},
		damage_groups = {fleshy=10},
		punch_attack_uses = 500,
	},
})
minetest.register_tool(":minecraft:golden_pickaxe", {
	description = "Golden Pickaxe",
	inventory_image = "items.png^[sheet:16x16:4,6",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 0,
		groupcaps = {
			cracky = {
				maxlevel = 2, -- Same as wooden
				uses = 33,
				times = { [2]=1.50, [3]=0.75 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 17,
	},
})
minetest.register_tool(":minecraft:diamond_pickaxe", {
	description = "Diamond Pickaxe",
	inventory_image = "items.png^[sheet:16x16:3,6",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 3,
		groupcaps = {
			cracky = {
				maxlevel = 3,
				uses = 1562,
				times = { [1]=0.65, [2]=0.40, [3]=0.25 }
			},
		},
		damage_groups = {fleshy=8},
		punch_attack_uses = 781,
	},
})

-- Shovels

minetest.register_tool(":minecraft:wooden_shovel", {
	description = "Wooden Shovel",
	inventory_image = "items.png^[sheet:16x16:0,5",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 33,
				times = { [1]=1.00, [2]=0.50, [3]=0.30 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 17,
	},
})
minetest.register_tool(":minecraft:stone_shovel", {
	description = "Stone Shovel",
	inventory_image = "items.png^[sheet:16x16:1,5",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 132,
				times = { [1]=0.50, [2]=0.35, [3]=0.20 }
			},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 66,
	},
})
minetest.register_tool(":minecraft:iron_shovel", {
	description = "Iron Shovel",
	inventory_image = "items.png^[sheet:16x16:2,5",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 251,
				times = { [1]=0.35, [2]=0.25, [3]=0.15 }
			},
		},
		damage_groups = {fleshy=6},
		punch_attack_uses = 126,
	},
})
minetest.register_tool(":minecraft:golden_shovel", {
	description = "Golden Shovel",
	inventory_image = "items.png^[sheet:16x16:4,5",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 33,
				times = { [1]=1.00, [2]=0.50, [3]=0.30 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 17,
	},
})
minetest.register_tool(":minecraft:diamond_shovel", {
	description = "Diamond Shovel",
	inventory_image = "items.png^[sheet:16x16:3,5",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 1562,
				times = { [1]=0.25, [2]=0.15, [3]=0.10 }
			},
		},
		damage_groups = {fleshy=8},
		punch_attack_uses = 781,
	},
})

-- Axes

minetest.register_tool(":minecraft:wooden_axe", {
	description = "Wooden Axe",
	inventory_image = "items.png^[sheet:16x16:0,7",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 2,
				uses = 33,
				times = { [1]=1.25, [2]=0.65, [3]=0.40 }
			},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 17,
	},
})
minetest.register_tool(":minecraft:stone_axe", {
	description = "Stone Axe",
	inventory_image = "items.png^[sheet:16x16:1,7",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 2,
				uses = 132,
				times = { [1]=0.65, [2]=0.40, [3]=0.25 }
			},
		},
		damage_groups = {fleshy=5},
		punch_attack_uses = 66,
	},
})
minetest.register_tool(":minecraft:iron_axe", {
	description = "Iron Axe",
	inventory_image = "items.png^[sheet:16x16:2,7",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 2,
				uses = 251,
				times = { [1]=0.45, [2]=0.30, [3]=0.20 }
			},
		},
		damage_groups = {fleshy=6},
		punch_attack_uses = 126,
	},
})
minetest.register_tool(":minecraft:golden_axe", {
	description = "Golden Axe",
	inventory_image = "items.png^[sheet:16x16:4,7",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 2,
				uses = 33,
				times = { [1]=1.25, [2]=0.65, [3]=0.40 }
			},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 17,
	},
})
minetest.register_tool(":minecraft:diamond_axe", {
	description = "Diamond Axe",
	inventory_image = "items.png^[sheet:16x16:3,7",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 3,
				uses = 1562,
				times = { [1]=0.35, [2]=0.20, [3]=0.15 }
			},
		},
		damage_groups = {fleshy=7},
		punch_attack_uses = 781,
	},
})

-- Swords

minetest.register_tool(":minecraft:wooden_sword", {
	description = "Wooden Sword",
	inventory_image = "items.png^[sheet:16x16:0,4",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1]=2.50, [2]=1.20, [3]=0.40}, uses=33, maxlevel=1}
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 17,
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_tool(":minecraft:stone_sword", {
	description = "Stone Sword",
	inventory_image = "items.png^[sheet:16x16:1,4",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1]=2.00, [2]=1.00, [3]=0.35}, uses=132, maxlevel=1}
		},
		damage_groups = {fleshy=5},
		punch_attack_uses = 66,
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_tool(":minecraft:iron_sword", {
	description = "Iron Sword",
	inventory_image = "items.png^[sheet:16x16:2,4",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1]=1.80, [2]=0.80, [3]=0.30}, uses=251, maxlevel=2}
		},
		damage_groups = {fleshy=6},
		punch_attack_uses = 126,
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_tool(":minecraft:diamond_sword", {
	description = "Diamond Sword",
	inventory_image = "items.png^[sheet:16x16:3,4",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1]=1.50, [2]=0.70, [3]=0.25}, uses=1562, maxlevel=3}
		},
		damage_groups = {fleshy=7},
		punch_attack_uses = 781,
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_tool(":minecraft:god_sword", {
	description = "God Sword",
	inventory_image = "items.png^[sheet:16x16:3,4",
	wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level = 3,
		groupcaps = {
			snappy = {times = {[1]=0.20, [2]=0.20, [3]=0.20}, uses=9999, maxlevel=3}
		},
		damage_groups = {fleshy=100},
		punch_attack_uses = 5000,
	},
	sound = {breaks = "default_tool_breaks"},
})
