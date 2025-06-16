local function drop_inventory(player)
    local pos = player:get_pos()
    local inv = player:get_inventory()
    
    -- Get all items from main inventory
    for i = 1, inv:get_size("main") do
        local stack = inv:get_stack("main", i)
        if not stack:is_empty() then
            -- Drop the item stack at player's position
            minetest.add_item(pos, stack)
            -- Clear the slot
            inv:set_stack("main", i, nil)
        end
    end
end

minetest.register_on_dieplayer(function(player)
    drop_inventory(player)
    return true
end)
