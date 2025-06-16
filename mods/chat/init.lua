-- Minetest mod: custom_chat
-- Displays player, server, and error messages on the middle-left of the screen like Minecraft

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- Configuration
local max_messages = 5 -- Maximum number of messages to display
local message_lifetime = 10 -- Seconds before a message fades out
local fade_duration = 2 -- Seconds for fade-out effect
local hud_position = {x = 0.02, y = 0.8} -- Middle-left, 2% from left edge
local hud_offset_y = 30 -- Vertical spacing between messages
local font_size = 25 -- Font size in pixels

-- Storage for chat messages per player
local player_huds = {}
local chat_messages = {}

-- Function to add a chat message for a player
local function add_chat_message(player_name, message)
    local player = minetest.get_player_by_name(player_name)
    if not player then
        minetest.log("error", "[" .. modname .. "] Player " .. player_name .. " not found")
        return
    end

    -- Initialize player's message list if not exists
    if not chat_messages[player_name] then
        chat_messages[player_name] = {}
    end

    -- Add new message with timestamp
    table.insert(chat_messages[player_name], {
        text = message,
        time = os.clock(),
        alpha = 255
    })
    minetest.log("action", "[" .. modname .. "] Added message for " .. player_name .. ": " .. message)

    -- Keep only the latest max_messages
    while #chat_messages[player_name] > max_messages do
        table.remove(chat_messages[player_name], 1)
    end
end

-- Function to update HUD for a player
local function update_hud(player_name)
    local player = minetest.get_player_by_name(player_name)
    if not player then
        minetest.log("error", "[" .. modname .. "] Player " .. player_name .. " not found for HUD update")
        return
    end

    -- Initialize player's HUD list if not exists
    if not player_huds[player_name] then
        player_huds[player_name] = {}
    end

    -- Remove old HUD elements
    for _, hud_id in ipairs(player_huds[player_name]) do
        player:hud_remove(hud_id)
    end
    player_huds[player_name] = {}

    -- Display current messages
    local messages = chat_messages[player_name] or {}
    local current_time = os.clock()

    for i, msg in ipairs(messages) do
        local age = current_time - msg.time
        local alpha = 255

        -- Calculate fade-out
        if age > message_lifetime - fade_duration then
            local fade_progress = (age - (message_lifetime - fade_duration)) / fade_duration
            alpha = math.floor(255 * (1 - fade_progress))
        end

        if alpha > 0 then
            local hud_id = player:hud_add({
                hud_elem_type = "text",
                position = hud_position,
                offset = {x = 0, y = (i - #messages) * hud_offset_y},
                text = msg.text,
                alignment = {x = 1, y = 1}, -- Left-aligned
                scale = {x = 100, y = 100},
                number = 0xFFFFFF, -- White text
                style = 0, -- Default font style
                z_index = 1000, -- High z_index to appear above hotbar
                size = {x = 1, y = 1}, -- Font size 25
                color = {r = 255, g = 255, b = 255, a = alpha}
            })
            table.insert(player_huds[player_name], hud_id)
            minetest.log("action", "[" .. modname .. "] HUD added for " .. player_name .. ": " .. msg.text .. " at x=" .. hud_position.x .. ", y=" .. (hud_position.y + (i - #messages) * hud_offset_y / 1000) .. ", size=" .. font_size)
        end
    end

    -- Remove expired messages
    while #messages > 0 and (current_time - messages[1].time) > message_lifetime do
        table.remove(messages, 1)
    end
end

-- Override minetest.log to capture server error messages
local old_minetest_log = minetest.log
minetest.log = function(level, message)
    if level == "error" then
        minetest.log("action", "[" .. modname .. "] Captured error message: " .. message)
        for _, player in ipairs(minetest.get_connected_players()) do
            local player_name = player:get_player_name()
            add_chat_message(player_name, "[Server Error] " .. message)
            update_hud(player_name)
        end
    end
    old_minetest_log(level, message)
end

-- Override minetest.chat_send_all to capture server messages
local old_chat_send_all = minetest.chat_send_all
minetest.chat_send_all = function(message)
    minetest.log("action", "[" .. modname .. "] Server message: " .. message)
    for _, player in ipairs(minetest.get_connected_players()) do
        local player_name = player:get_player_name()
        add_chat_message(player_name, "[Server] " .. message)
        update_hud(player_name)
    end
    old_chat_send_all(message)
end

-- Override minetest.chat_send_player to capture targeted server messages
local old_chat_send_player = minetest.chat_send_player
minetest.chat_send_player = function(name, message)
    minetest.log("action", "[" .. modname .. "] Server message to " .. name .. ": " .. message)
    if minetest.get_player_by_name(name) then
        add_chat_message(name, "[Server] " .. message)
        update_hud(name)
    end
    old_chat_send_player(name, message)
end

-- Handle player chat messages
minetest.register_on_chat_message(function(name, message)
    minetest.log("action", "[" .. modname .. "] Player chat from " .. name .. ": " .. message)
    local formatted_message = "<" .. name .. "> " .. message
    for _, player in ipairs(minetest.get_connected_players()) do
        local player_name = player:get_player_name()
        add_chat_message(player_name, formatted_message)
        update_hud(player_name)
    end
    return true -- Prevent default chat display
end)

-- Periodic update to handle fading
minetest.register_globalstep(function(dtime)
    for player_name in pairs(chat_messages) do
        update_hud(player_name)
    end
end)

-- Clean up when a player leaves
minetest.register_on_leaveplayer(function(player)
    local player_name = player:get_player_name()
    player_huds[player_name] = nil
    chat_messages[player_name] = nil
    minetest.log("action", "[" .. modname .. "] Cleaned up data for " .. player_name .. "\"")
end)

minetest.log("action", "[" .. modname .. "] Loaded")
