-- ClearUnauthorizedItems mod for Minetest
-- Removes chest_of_everything:chest and chest_of_everything:bag from players without server privilege

local CHECK_INTERVAL = 10 -- Time between inventory checks (seconds)
local ITEMS_TO_CLEAR = {
    "chest_of_everything:chest",
    "chest_of_everything:bag"
}
local PRIVILEGE = "server"
local NOTIFICATION_MESSAGE = "Unauthorized items (chest_of_everything:chest or bag) were removed from your inventory!"

-- Function to check and clear unauthorized items
local function check_player_inventories()
    for _, player in ipairs(minetest.get_connected_players()) do
        local player_name = player:get_player_name()
        
        -- Skip players with server privilege
        if minetest.check_player_privs(player_name, { [PRIVILEGE] = true }) then
            return
        end
        
        local inv = player:get_inventory()
        local items_removed = false
        
        -- Check main inventory
        for _, item_name in ipairs(ITEMS_TO_CLEAR) do
            if inv:contains_item("main", item_name) then
                inv:remove_item("main", item_name)
                items_removed = true
            end
        end
        
        -- Notify player and log if items were removed
        if items_removed then
            minetest.chat_send_player(player_name, NOTIFICATION_MESSAGE)
            minetest.log("action", "[ClearUnauthorizedItems] Removed unauthorized items from " .. player_name)
        end
    end
end

-- Register periodic check
minetest.register_globalstep(function(dtime)
    -- Run check every CHECK_INTERVAL seconds
    local timer = minetest.get_gametime() % CHECK_INTERVAL
    if timer < dtime then
        check_player_inventories()
    end
end)

minetest.log("action", "[ClearUnauthorizedItems] Mod loaded successfully")