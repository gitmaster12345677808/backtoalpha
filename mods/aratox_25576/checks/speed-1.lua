local warned_players = {}

function aratox_checks.speed_1()
	local speed_limit = tonumber(minetest.settings:get("movement_speed_walk")) or 4.0
	local players = minetest.get_connected_players()

	for _, player in ipairs(players) do
		local name = player:get_player_name()

		-- Skip players with "fast" privilege
		if not minetest.check_player_privs(name, {fast = true}) then
			local v = player:get_player_velocity()

			if math.abs(v.x) > speed_limit or math.abs(v.z) > speed_limit then
				if not warned_players[name] then
					minetest.chat_send_player(name, "§eAntiCheat: You have been detected using speed.")
					warned_players[name] = true

					-- Pull player downwards gently
					player:set_velocity({x = v.x, y = -10, z = v.z})

					-- Optional: reset the warning after a while
					minetest.after(30, function()
						warned_players[name] = nil
					end)
				end
			end
		end
	end
end

