dofile(minetest.get_modpath('mcnt_tools')..'/recipes.lua')

minetest.register_tool(":minecraft:wooden_pickaxe", {
	description = "Wooden Pickaxe",
	inventory_image = "items.png^[sheet:16x16:0,6",
    wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 0,
		groupcaps = {
			cracky = {
				maxlevel = 1,
				uses = 59,
				times = { [3]=1.60 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 30,
	},
})
minetest.register_tool(":minecraft:stone_pickaxe", {
	description = "Stone Pickaxe",
	inventory_image = "items.png^[sheet:16x16:1,6",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 0,
		groupcaps = {
			cracky = {
				maxlevel = 1,
				uses = 131,
				times = { [2]=2.0, [3]=1.00 }
			},
		},
		damage_groups = {fleshy=3},
		punch_attack_uses = 66,
	},
})
minetest.register_tool(":minecraft:iron_pickaxe", {
	description = "Iron Pickaxe",
	inventory_image = "items.png^[sheet:16x16:2,6",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level=1,
		groupcaps = {
			cracky = {
				maxlevel = 2,
				uses = 250,
				times = { [1]=4.00, [2]=1.60, [3]=0.80 }
			},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 126,
	},
})
minetest.register_tool(":minecraft:super_pickaxe", {
    description = "Super Pickaxe",
    inventory_image = "items.png^[sheet:16x16:2,6",
    wield_scale = {x=2.0, y=1.5, z=1.5},
    tool_capabilities = {
        max_drop_level = 5, -- High drop level to ensure drops from any block
        groupcaps = {
            cracky = {
                maxlevel = 5,
                uses = 1000,
                times = { [1]=0.10, [2]=0.10, [3]=0.10, [4]=0.10, [5]=0.10 }
            },
            crumbly = {
                maxlevel = 5,
                uses = 1000,
                times = { [1]=0.10, [2]=0.10, [3]=0.10, [4]=0.10, [5]=0.10 }
            },
            choppy = {
                maxlevel = 5,
                uses = 1000,
                times = { [1]=0.10, [2]=0.10, [3]=0.10, [4]=0.10, [5]=0.10 }
            },
            snappy = {
                maxlevel = 5,
                uses = 1000,
                times = { [1]=0.10, [2]=0.10, [3]=0.10, [4]=0.10, [5]=0.10 }
            },
            unbreakable = {
                maxlevel = 5,
                uses = 1000,
                times = { [1]=0.10 }
            },
            indestructible = {
                maxlevel = 5,
                uses = 1000,
                times = { [1]=0.10 } -- Explicitly handle indestructible group
            },
        },
        damage_groups = {fleshy=6},
        punch_attack_uses = 500,
    },
    after_use = function(itemstack, user, node, digparams)
        if digparams.wear > 0 then
            itemstack:add_wear(digparams.wear)
        end
        return itemstack
    end,
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.type == "node" then
            local pos = pointed_thing.under
            local node = minetest.get_node(pos)
            local node_def = minetest.registered_nodes[node.name]
            -- Check if the node is diggable or indestructible
            if node_def and (node_def.diggable == false or node_def.groups.indestructible) then
                -- Override restrictions and force dig
                minetest.remove_node(pos) -- Directly remove the node
                -- Drop items as if the node was dug
                if node_def.drop then
                    local drops = minetest.get_node_drops(node.name, ":minecraft:super_pickaxe")
                    for _, drop in ipairs(drops) do
                        minetest.add_item(pos, drop)
                    end
                end
            else
                -- Normal digging for other blocks
                minetest.node_dig(pos, node, user)
            end
            -- Apply wear for durability
            itemstack:add_wear(65535 / 1000) -- Equivalent to 1000 uses
            return itemstack
        end
    end,
})
minetest.register_tool(":minecraft:golden_pickaxe", {
	description = "Golden Pickaxe",
	inventory_image = "items.png^[sheet:16x16:4,6",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level=2,
		groupcaps = {
			cracky = {
				maxlevel = 2,
				uses = 32,
				times = { [3]=1.60 }
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
		max_drop_level=3,
		groupcaps = {
			cracky = {
				maxlevel = 3,
				uses = 1561,
				times = { [1]=2.0, [2]=1.0, [3]=0.50 }
			},
		},
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
})

-- Shovels!

minetest.register_tool(":minecraft:wooden_shovel", {
	description = "Wooden Shovel",
	inventory_image = "items.png^[sheet:16x16:0,5",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 59,
				times = { [1]=3.00, [2]=1.60, [3]=0.60 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 30,
	},
})
minetest.register_tool(":minecraft:stone_shovel", {
	description = "Stone Shovel",
	inventory_image = "items.png^[sheet:16x16:1,5",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 3,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 131,
				times = { [1]=1.80, [2]=1.20, [3]=0.50 }
			},
		},
		damage_groups = {fleshy=3},
		punch_attack_uses = 66,
	},
})
minetest.register_tool(":minecraft:iron_shovel", {
	description = "Iron Shovel",
	inventory_image = "items.png^[sheet:16x16:2,5",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		max_drop_level = 4,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 250,
				times = { [1]=1.50, [2]=0.90, [3]=0.40 }
			},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 126,
	},
})
minetest.register_tool(":minecraft:golden_shovel", {
	description = "Golden Shovel",
	inventory_image = "items.png^[sheet:16x16:4,5",
wield_scale = {x=2.0, y=2.0, z=1.5},
	tool_capabilities = {
		max_drop_level = 2,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 32,
				times = { [1]=3.00, [2]=1.60, [3]=0.60 }
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
		max_drop_level = 5,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 1561,
				times = {[1]=1.10, [2]=0.50, [3]=0.30}
			},
		},
		damage_groups = {fleshy=5},
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
				maxlevel = 1,
				uses = 59,
				times = { [2]=3.00, [3]=1.60 }
			},
		},
		damage_groups = {fleshy=7},
		punch_attack_uses = 30,
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
				maxlevel = 1,
				uses = 131,
				times = { [1]=3.00, [2]=2.00, [3]=1.30 }
			},
		},
		damage_groups = {fleshy=9},
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
				uses = 250,
				times = { [1]=2.50, [2]=1.40, [3]=1.00 }
			},
		},
		damage_groups = {fleshy=9},
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
				uses = 32,
				times = { [2]=3.00, [3]=1.60 }
			},
		},
		damage_groups = {fleshy=7},
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
				uses = 1561,
				times = { [1]=3.00, [2]=1.60, [3]=0.60 }
			},
		},
		damage_groups = {fleshy=9},
		punch_attack_uses = 781,
	},
})
minetest.register_tool(":minecraft:diamond_sword", {
	description = "Diamond Sword",
	inventory_image = "items.png^[sheet:16x16:3,4",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1]=1.50, [2]=0.90, [3]=0.30}, uses=1561, maxlevel=3}
		},
		damage_groups = {fleshy = 9},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool(":minecraft:wooden_sword", {
	description = "Wooden Sword",
	inventory_image = "items.png^[sheet:16x16:0,4",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1]=2.50, [2]=1.20, [3]=0.60}, uses=59, maxlevel=1}
		},
		damage_groups = {fleshy = 5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool(":minecraft:iron_sword", {
	description = "Iron Sword",
	inventory_image = "items.png^[sheet:16x16:2,4",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1]=2.00, [2]=0.80, [3]=0.40}, uses=250, maxlevel=2}
		},
		damage_groups = {fleshy = 8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool(":minecraft:stone_sword", {
	description = "Stone Sword",
	inventory_image = "items.png^[sheet:16x16:1,4",
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level = 1,
		groupcaps = {
			snappy = {times = {[1]=2.00, [2]=1.00, [3]=0.50}, uses=131, maxlevel=1}
		},
		damage_groups = {fleshy = 7},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_tool(":minecraft:god_sword", {
	description = "God Sword",
	inventory_image = "items.png^[sheet:16x16:3,4", -- Diamond sword texture
wield_scale = {x=2.0, y=1.5, z=1.5},
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level = 3,
		groupcaps = {
			snappy = {times = {[1]=0.1, [2]=0.1, [3]=0.1}, uses=99999, maxlevel=3}
		},
		damage_groups = {fleshy = 1000000}, -- Massive damage
	},
	sound = {breaks = "default_tool_breaks"},
})
