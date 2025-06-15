-- AntiFly mod for Minetest
-- Kicks players who are flying without the 'fly' privilege

local CHECK_INTERVAL = 1 -- Time between checks (seconds)
local MAX_SUSPICIOUS_MOVEMENT = 5 -- Max vertical movement (nodes) without ground contact
local KICK_MESSAGE = "Flying is not allowed without the fly privilege!"

-- Table to track player states
local player_data = {}

-- Function to check if player is on ground or near a solid node
local function is_player_grounded(player)
    local pos = player:get_pos()
    local node_below = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
    local node_at = minetest.get_node(pos)
    
    -- Check if player is standing on a solid node or in a walkable node (e.g., water)
    return minetest.registered_nodes[node_below.name].walkable or
           minetest.registered_nodes[node_at.name].walkable
end

-- Function to check for unauthorized flying
local function check_flying_players()
    for _, player in ipairs(minetest.get_connected_players()) do
        local name = player:get_player_name()
        local pos = player:get_pos()
        
        -- Skip players with fly privilege
        if minetest.check_player_privs(name, {fly = true}) then
            player_data[name] = nil
            return
        end
        
        -- Initialize player data if not exists
        if not player_data[name] then
            player_data[name] = {
                last_pos = pos,
                suspicious_count = 0,
                last_grounded_time = minetest.get_gametime()
            }
        end
        
        local data = player_data[name]
        local y_diff = pos.y - data.last_pos.y
        
        -- Update last position
        data.last_pos = pos
        
        -- Check if player is grounded
        if is_player_grounded(player) then
            data.suspicious_count = 0
            data.last_grounded_time = minetest.get_gametime()
            return
        end
        
        -- Detect suspicious upward movement
        if y_diff > 0 and not player:get_player_control().jump then
            data.suspicious_count = data.suspicious_count + y_diff
        end
        
        -- Kick if suspicious movement exceeds threshold or player hasn't been grounded for too long
        local time_since_grounded = minetest.get_gametime() - data.last_grounded_time
        if data.suspicious_count > MAX_SUSPICIOUS_MOVEMENT or time_since_grounded > 10 then
            minetest.kick_player(name, KICK_MESSAGE)
            player_data[name] = nil
        end
    end
end

-- Register periodic check
minetest.register_globalstep(function(dtime)
    -- Run check every CHECK_INTERVAL seconds
    local timer = minetest.get_gametime() % CHECK_INTERVAL
    if timer < dtime then
        check_flying_players()
    end
end)

-- Clean up player data on leave
minetest.register_on_leaveplayer(function(player)
    local name = player:get_player_name()
    player_data[name] = nil
end)

minetest.log("action", "[AntiFly] Mod loaded successfully")