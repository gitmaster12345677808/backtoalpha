local oldpos = {}

local function is_flying(player)
	if not player or not player:is_player() then return false end

	local pos = player:get_pos()
	if not pos then return false end

	if minetest.check_player_privs(player:get_player_name(), {fly = true}) then
		return false
	end

	local velocity = player:get_player_velocity()

	-- Find the nearest solid node up to 3 blocks below the player
	local ground_y = nil
	for i = 1, 3 do
		local check_pos = {x = pos.x, y = pos.y - i, z = pos.z}
		local node = minetest.get_node(check_pos).name
		if node ~= "air" then
			ground_y = check_pos.y
			break
		end
	end

	-- If no ground found within 3 blocks below, treat as flying
	if not ground_y then
		ground_y = pos.y - 4 -- more than 3 blocks away, treat as flying
	end

	-- Calculate how far above the ground the player is
	local height_above_ground = pos.y - ground_y

	-- If player is more than 3 blocks above ground, moving upward in air, count as flying
	if height_above_ground > 3 and velocity.y > 0 then
		return true
	end

	return false
end

function aratox_checks.fly_1()
	local players = minetest.get_connected_players()
	for _, player in ipairs(players) do
		if not player or not player:is_player() then goto continue end
		local name = player:get_player_name()
		local pos = player:get_pos()
		if not pos then goto continue end

		if not is_flying(player) then
			-- Update last safe position if not flying
			oldpos[name] = pos
		else
			-- Flying detected, teleport back to last safe position if known
			if oldpos[name] then
				player:set_pos(oldpos[name])
				minetest.chat_send_player(name, "§cFlying is not allowed! You have been moved back.")
			else
				-- If no safe pos stored, freeze player movement temporarily
				player:set_velocity({x=0,y=0,z=0})
				player:set_physics_override({speed=0, jump=0, gravity=1})
				minetest.chat_send_player(name, "§cFlying detected! Please move to the ground.")
			end
		end

		::continue::
	end
end

