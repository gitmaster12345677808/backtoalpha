minetest.register_on_player_hpchange(function(player, hp_change, reason)
	-- Play sound only when damage is taken
	if hp_change < 0 then
		minetest.sound_play("hurt", {
			to_player = player:get_player_name(),
			gain = 1.0,
			max_hear_distance = 16,
		})
	end
	return hp_change
end, true)  -- true = handle HP change after all modifications
