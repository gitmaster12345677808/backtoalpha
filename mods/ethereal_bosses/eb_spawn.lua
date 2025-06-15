
--- PIXOES 
mobs:spawn({
	name = "ethereal_bosses:pixies_red",
	nodes = "air",
	--neighbors = {"ethereal:illumishroom"},
	max_light = 7,
	chance = 8000,
	min_height = 0,
	max_height = 200,
	active_object_count = 5,
})


mobs:spawn({
	name = "ethereal_bosses:pixies_green",
	nodes = "air",
	--neighbors = {"ethereal:illumishroom2"},
	max_light = 7,
	chance = 8000,
	min_height = 0,
	max_height = 200,
	active_object_count = 5,
})


mobs:spawn({
	name = "ethereal_bosses:pixies_blue",
	nodes = "air",
	--neighbors = {"ethereal:illumishroom3"},
	max_light = 7,
	chance = 8000,
	min_height = 0,
	max_height = 200,
	active_object_count = 5,
})



mobs:spawn({
	name = "ethereal_bosses:elder",
	nodes = "group:soil",
	--neighbors = {"ethereal:illumishroom3"},
	max_light = 7,
	chance = 4000,
	min_height = 0,
	max_height = 200,
	active_object_count = 1,
})



-- SPAWNS DEF : ========================================

if core.get_modpath("ethereal") then

mobs:spawn({
	name = "ethereal_bosses:crazymushroom",
	nodes = {"ethereal:mushroom_dirt", "ethereal:mushroom"},
	max_light = 7,
	interval = 60,
	chance = 300000,
	max_height = 200,
	min_height = 0,
})


mobs:spawn({
	name = "ethereal_bosses:heated",
	nodes = {"ethereal:fiery_dirt"},
	max_light = 7,
	interval = 60,
	chance = 300000,
	max_height = 200,
	min_height = 0,
})


mobs:spawn({
	name = {"ethereal_bosses:frostyqueen"},
	nodes = {"ethereal:crystal", "ethereal:frost_leaves"},
	max_light = 7,
	interval = 60,
	chance = 300000,
	max_height = 200,
})

-- DEPTHS EYE
mobs:spawn({
	name = "ethereal_bosses:depthseye",
	nodes = {"air"},
	max_light = 7,
	chance = 80000,
	active_object_count = 1,
	max_height = -100,
})



-- FUNGS
mobs:spawn({
	name = "ethereal_bosses:fungs",
	nodes = {"ethereal:mushroom_dirt", "ethereal:mushroom"},
	min_light = 8,
	max_light = 14,
	interval = 60,
	chance = 20000,
	min_height = 0,
	max_height = 200,
	
})





--- NATURE 
mobs:spawn({
	name = "ethereal_bosses:nature_guardian",
	nodes = "ethereal:prairie_dirt",
	min_light = 8,
	--max_light = 14,
	chance = 15000,
	min_height = 0,
	max_height = 200,
})



end



--- SUP MCL : ==============================================================
if core.get_modpath("mcl_core") then

mobs:spawn({
	name = "ethereal_bosses:crazymushroom",
	nodes = {"mcl_core:mycelium"},
	max_light = 7,
	interval = 60,
	chance = 300000,
	max_height = 200,
	min_height = 0,
})


mobs:spawn({
	name = "ethereal_bosses:heated",
	nodes = {"mcl_nether:netherrack","mcl_blackstone:blackstone"},
	max_light = 7,
	interval = 60,
	chance = 300000,
	--max_height = 200,
	min_height = -2500,
})


mobs:spawn({
	name = {"ethereal_bosses:frostyqueen"},
	nodes = {"mcl_core:snowblock"},
	max_light = 7,
	interval = 60,
	chance = 300000,
	max_height = 200,
})


-- DEPTHS EYE
mobs:spawn({
	name = "ethereal_bosses:depthseye",
	nodes = {"air"},
	max_light = 7,
	chance = 80000,
	active_object_count = 1,
	max_height = -10,
})



-- FUNGS
mobs:spawn({
	name = "ethereal_bosses:fungs",
	nodes = {"mcl_core:mycelium"},
	min_light = 8,
	max_light = 14,
	interval = 60,
	chance = 20000,
	min_height = 0,
	max_height = 200,
	
})





--- NATURE 
mobs:spawn({
	name = "ethereal_bosses:nature_guardian",
	nodes = "mcl_lush_caves:moss",
	min_light = 8,
	--max_light = 14,
	chance = 15000,
	min_height = -10,
	--max_height = 200,
})



end
