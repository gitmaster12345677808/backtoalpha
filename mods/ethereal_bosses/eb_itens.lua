local S = core.get_translator("ethereal_bosses")

-- DEATHUS EYE : 

core.register_craftitem("ethereal_bosses:deye", {
    description = S("Eye"),
    inventory_image = "deye.png",
 	
 
})


--- NECTAR


core.register_craftitem("ethereal_bosses:nectar", {
    description = S("Nectar"),
    inventory_image = "nectar.png",
 	
 
})


-- Queen's bottle :


core.register_craftitem("ethereal_bosses:queen_bottle", {
    description = S("Queen's bottle"),
    inventory_image = "queen_bottle.png",
 	
 
})



-- ROTTEN WOOD :


core.register_craftitem("ethereal_bosses:rotten_wood", {
    description = S("Rotten Wood"),
    inventory_image = "rotten_wood.png",
 	
 
})


-- NATURE DROPS : ===========================================================================

core.register_craftitem("ethereal_bosses:natureroots", {
    description = S("Nature Guardian Roots"),
    inventory_image = "natureroots.png",
 
	
})



-- TROFÉUS : =================================================================================

core.register_node("ethereal_bosses:frostyqueen_trophy", {
	description = S("Frosty Queen Trophy"),
	drawtype = "mesh",
	mesh = "trofeus_ethreal.obj",
	tiles = {"trufeus_frostyqueen.png"},
	use_texture_alpha = "clip",
	wield_scale = {x = 1, y = 1, z = 1},
	groups = {dig_immediate = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	-- CAIXA DE COLISÃO :
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-0.5, -0.5, 0.45, 0.5, 0.5, 0.5},
		},
	},
})

core.register_node("ethereal_bosses:crazymushrrom_trophy", {
	description = S("Crazy Mushrrom Trophy"),
	drawtype = "mesh",
	mesh = "trofeus_ethreal.obj",
	tiles = {"trufeus_crazymushroom.png"},
	use_texture_alpha = "clip",
	wield_scale = {x = 1, y = 1, z = 1},
	groups = {dig_immediate = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	-- CAIXA DE COLISÃO :
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-0.5, -0.5, 0.45, 0.5, 0.5, 0.5},
		},
	},
})

core.register_node("ethereal_bosses:heated_trophy", {
	description = S("Heated Trophy"),
	drawtype = "mesh",
	mesh = "trofeus_ethreal.obj",
	tiles = {"trufeus_heated.png"},
	use_texture_alpha = "clip",
	wield_scale = {x = 1, y = 1, z = 1},
	groups = {dig_immediate=3},
	paramtype = "light",
	paramtype2 = "facedir",
	-- CAIXA DE COLISÃO :
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-0.5, -0.5, 0.45, 0.5, 0.5, 0.5},
		},
	},
})




---- ITENS : ========================================================================================

-- CURA MILAGROSA :
-- Sound : https://freesound.org/people/craigglenday/sounds/517173/ (CC0)


core.register_craftitem("ethereal_bosses:miraclehealing", {
	description = S("Miracle Healing"),
	inventory_image = "miraclehealing.png",
	stack_max = 1,
	groups = {vessel = 1},
	-- função para recuperar vida simples
	on_use = function(itemstack, user, pointed_thing,pos)
	
	
	
		local hp = user:get_hp() -- usuario consegue o valor atual de sua vida
		if hp ~= 20 then -- comparando vida
			user:set_hp(hp + 10)  -- atribuindo mais 10 de vida
		end

		core.sound_play("bebendo", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		}, true)

		local pos = user:get_pos()

		for i = 1, 30 do

			core.add_particle({
				pos = pos,
				acceleration = 0,
				velocity = {
					x = math.random(-3, 3),
					y = math.random(-3, 3),
					z = math.random(-3, 3)
				},
				-- x ou y ,ou z  = random (-3 right , 3 left )
				size = 2,
				expirationtime = 2.0,
				collisiondetection = false,
				vertical = false,
				texture = "curam.png",
				glow = 8,
			})
		end

		return "ethereal_bosses:queen_bottle"
	end
})





core.register_craftitem("ethereal_bosses:natureroots", {
    description = S("Nature Guardian Roots"),
    inventory_image = "natureroots.png",
 	
})

