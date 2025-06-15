-- Register cheat detection with a 5-second delay before kicking
minetest.register_on_cheat(function(player, cheat)
    local player_name = player:get_player_name()
    minetest.after(5, function()
        if minetest.get_player_by_name(player_name) then -- Ensure player is still online
            minetest.kick_player(player_name, "\n\nAratox caught you cheating! (AntiCheat)")
        end
    end)
end)