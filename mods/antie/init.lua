-- Defining the mod name and path
local modname = "yellow_join_leave"
local modpath = minetest.get_modpath(modname)

-- Registering the join player event for custom message
minetest.register_on_joinplayer(function(player)
    local player_name = player:get_player_name()
    minetest.chat_send_all(minetest.colorize("#FFFF00", player_name .. " joined the game"))
end)

-- Registering the leave player event for custom message
minetest.register_on_leaveplayer(function(player)
    local player_name = player:get_player_name()
    minetest.chat_send_all(minetest.colorize("#FFFF00", player_name .. " left the game"))
end)

-- Suppressing the default join message
minetest.register_on_chat_message(function(name, message)
    -- Check if the message is the default join message
    if message:match("^%* .+ joined the game$") then
        return true -- Suppress the message by returning true
    end
    return false -- Allow other messages
end)
