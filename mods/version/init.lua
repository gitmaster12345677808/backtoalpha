minetest.register_on_joinplayer(function(player)
	player:hud_add({
		hud_elem_type = "text",
		position = {x = 0.01, y = 0.01}, -- Still top-left aligned
		offset = {x = 173, y = 10}, -- Moved 7 pixels to the right
		text = "BackToAlpha Alpha 1.0.17_04",
		alignment = {x = 0, y = 0},
		scale = {x = 100, y = 25}, -- Approximate font size
		number = 0xFFFFFF, -- White
	})
end)

