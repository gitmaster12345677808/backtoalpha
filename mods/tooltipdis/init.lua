-- Mod: no_item_tooltips
-- Purpose: Completely disable all item name tooltips in the inventory, like Minecraft Alpha

minetest.register_on_mods_loaded(function()
    -- Step 1: Override get_item_def to suppress all tooltip-related fields
    local old_get_item_def = minetest.get_item_def
    minetest.get_item_def = function(itemstring)
        local def = old_get_item_def(itemstring)
        if def then
            def.description = "" -- Clear description
            def._tooltip = "" -- Clear custom tooltip
            def._name = "" -- Clear any name field
            def.short_description = "" -- Clear short description (used by some mods)
            def._description = "" -- Clear any redundant description fields
            def.name = "" -- Prevent itemstring fallback
        end
        return def
    end

    -- Step 2: Override formspec rendering to disable tooltip elements
    local old_get_inventory_formspec = minetest.get_inventory_formspec
    minetest.get_inventory_formspec = function(player, formspec_name)
        local formspec = old_get_inventory_formspec(player, formspec_name)
        -- Append an empty tooltip to suppress all tooltip rendering
        formspec = formspec .. "tooltip[][]"
        -- Replace any existing tooltip definitions with empty ones
        formspec = formspec:gsub("tooltip%[[^%]]*%]%[[^%]]*%]", "tooltip[][]")
        return formspec
    end

    -- Step 3: Override itemstack tooltip generation
    local old_get_tooltip = minetest.get_itemstack_tooltip
    minetest.get_itemstack_tooltip = function(itemstack)
        return "" -- Return empty string to suppress all tooltips
    end

    -- Step 4: Handle unified_inventory compatibility if present
    if minetest.get_modpath("unified_inventory") then
        unified_inventory.register_page("no_tooltips", {
            get_formspec = function(player)
                local formspec = unified_inventory.default.get_formspec(player)
                -- Ensure no tooltips in unified_inventory
                formspec.formspec = formspec.formspec .. "tooltip[][]"
                formspec.formspec = formspec.formspec:gsub("tooltip%[[^%]]*%]%[[^%]]*%]", "tooltip[][]")
                return formspec
            end
        })
        -- Override unified_inventory's tooltip function if it exists
        if unified_inventory.get_itemstack_tooltip then
            unified_inventory.get_itemstack_tooltip = function(itemstack)
                return "" -- Suppress tooltips in unified_inventory
            end
        end
    end
end)