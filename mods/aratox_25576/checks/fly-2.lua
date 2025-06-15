local cheatcount = {}
local grounded_players = {}

-- Restore normal physics
local function restore_physics(player)
	if not player or not player:is_player() then return end

	local name = player:get_player_name()
	if grounded_players[name] then
		player:set_physics_override({speed = 1, jump = 1, gravity = 1})
		grounded_players[name] = nil
	end
end

-- Check if player landed on a block
local function check_if_landed(player)
	if not player or not player:is_player() then return end

	local name = player:get_player_name()
	local pos = player:get_pos()
	if not pos then return end

	local node_below = minetest.get_node({
		x = pos.x, y = pos.y - 1, z = pos.z
	}).name

	if node_below ~= "air" then
		restore_physics(player)
	else
		minetest.after(0.5, check_if_landed, player)
	end
end

-- Main fly check logic
function aratox_checks.fly_2()
	local players = minetest.get_connected_players()
	for _, player in ipairs(players) do
		if not player or not player:is_player() then
			goto continue
		end

		local name = player:get_player_name()
		local pos = player:get_pos()
		if not pos then
			goto continue
		end

		-- Skip players with fly privilege
		if minetest.check_player_privs(name, {fly = true}) then
			restore_physics(player)
			goto continue
		end

		local velo = player:get_velocity()
		local vY = math.abs(velo.y)

		-- Check if player is standing still in mid-air (suspicious)
		local air_below = true
		for dx = -1, 1 do
			for dz = -1, 1 do
				local node = minetest.get_node({
					x = pos.x + dx, y = pos.y - 1, z = pos.z + dz
				}).name
				if node ~= "air" then
					air_below = false
					break
				end
			end
			if not air_below then break end
		end

		if vY == 0 and air_below then
			cheatcount[name] = (cheatcount[name] or 0) + 1

			if cheatcount[name] >= 5 then
				if not grounded_players[name] then
					-- Pull to ground with high gravity
					player:set_velocity({x = 0, y = -10, z = 0})
					player:set_physics_override({speed = 0.2, jump = 0, gravity = 4.0})
					grounded_players[name] = true

					minetest.chat_send_player(name, "§eAntiCheat: Suspicious flying detected. You have been pulled down.")
					minetest.after(0.5, check_if_landed, player)
					minetest.after(10, function()
						if grounded_players[name] then
							restore_physics(player)
						end
					end)
				end

				cheatcount[name] = nil -- reset counter after action
			end
		else
			-- Reset count if behavior is normal
			cheatcount[name] = 0
			restore_physics(player)
		end

		::continue::
	end
end

