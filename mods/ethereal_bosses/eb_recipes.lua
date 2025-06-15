-- CURA
core.register_craft({
	output = "ethereal_bosses:miraclehealing",
	recipe = {
		{"ethereal_bosses:nectar"},
		{"ethereal_bosses:deye"},
		{"ethereal_bosses:queen_bottle"}
	}
})


core.register_craft({
	output = "ethereal_bosses:queen_bottle 1",
	recipe = {
		{"group:glass"},
		
	}
})

-- TOOLS  : ===============================================================================

core.register_craft({
    type = "shaped",
    output = "ethereal_bosses:pick_mushroom",
    recipe = {
         {"group:mushroom","group:mushroom","group:mushroom"},
        {"","group:stick",""},
        {"", "group:stick",""}
    }
})


core.register_craft({
    type = "shaped",
    output = "ethereal_bosses:shovel_mushroom",
    recipe = {
         {"","group:mushroom",""},
        {"","group:stick",""},
        {"", "group:stick",""}
    }
})


core.register_craft({
    type = "shaped",
    output = "ethereal_bosses:axe_mushroom",
    recipe = {
        {"group:mushroom","group:mushroom",""},
        {"group:mushroom","group:mushroom",""},
        {"", "group:stick",""}
    }
})

core.register_craft({
    type = "shaped",
    output = "ethereal_bosses:sword_mushroom",
    recipe = {
        {"","group:mushroom",""},
        {"","group:mushroom",""},
        {"", "group:stick",""}
    }
})



--NATURE ITENS : ==========================================================================
-- CRAFT :

core.register_craft({
    type = "shaped",
    output = "ethereal_bosses:naturewhip",
    recipe = {
        {"","ethereal_bosses:natureroots",""},
        {"ethereal_bosses:natureroots","group:stick",""},
        {"", "group:stick",""}
    }
})


core.register_craft({
    type = "shaped",
    output = "ethereal_bosses:naturerod",
    recipe = {
        {"","group:stone",""},
        {"","ethereal_bosses:natureroots",""},
        {"", "group:stick",""}
    }
})



-- NOVOS ITENS : ==================================================================================
core.register_craft({
	output = "ethereal_bosses:nectar 1",
	recipe = {
		
		{"group:flower", "group:flower", "group:flower"},
		
	}
})



core.register_craft({
	output = "ethereal_bosses:rotten_wood 1",
	recipe = {
		{"", "group:tree", "group:water_bucket"},
		
	}
})

