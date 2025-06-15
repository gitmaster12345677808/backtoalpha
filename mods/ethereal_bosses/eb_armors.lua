
-- ===========================================================================================================
-- ARMADURA AGORA SOMENTE NO 3d ARMOR , NÃO MCL
local S = core.get_translator("ethereal_bosses")

if core.get_modpath("3d_armor") then

if core.global_exists("armor") and armor.elements then
	table.insert(armor.elements, "hand")
end



	armor:register_armor("ethereal_bosses:helmet_roots", {
			description = S("Roots Helmet"),
			inventory_image = "roots_inv_helmet_roots.png",
			groups = {armor_head=1, armor_heal=6, armor_use=300,
				physics_speed=-0.02, physics_gravity=-0.1},
			armor_groups = {fleshy=10},
			damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
		})


		armor:register_armor("ethereal_bosses:chestplate_roots", {
		description = S("Roots Chestplate"),
		inventory_image = "roots_inv_chestplate_roots.png",
		groups = {armor_torso=1, armor_heal=6, armor_use=300,
			physics_speed=-0.05, physics_gravity=-0.2},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})

	


	-- CRAFT :

    core.register_craft({
    type = "shaped",
    output = "ethereal_bosses:helmet_roots",
    recipe = {
         {"ethereal_bosses:natureroots","ethereal_bosses:natureroots","ethereal_bosses:natureroots"},
        {"ethereal_bosses:natureroots","","ethereal_bosses:natureroots"},
        {"", "",""}
    }
	})

	

	core.register_craft({
	    type = "shaped",
	    output = "ethereal_bosses:chestplate_roots",
	    recipe = {
	         {"ethereal_bosses:natureroots","","ethereal_bosses:natureroots"},
	        {"ethereal_bosses:natureroots","ethereal_bosses:natureroots","ethereal_bosses:natureroots"},
	        {"ethereal_bosses:natureroots", "ethereal_bosses:natureroots","ethereal_bosses:natureroots"}
	    }
	})
	
	
	
	armor:register_armor("ethereal_bosses:glove_glove", {
		description = S("Crazy Mushroom Glove"),
		inventory_image = "ethereal_bosses_inv_glove_glove.png",
		groups = {
			armor_hand = 2, armor_heal = 2, armor_use = 40,
			physics_speed = 0.5, physics_jump = 0.5
		},
	})



end



