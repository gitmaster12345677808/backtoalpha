-- Mod: fixed_cloud_height
-- Purpose: Set clouds to generate at y=108 to y=112, like Minecraft Alpha

-- Set cloud parameters when a player joins
minetest.register_on_joinplayer(function(player)
    -- Set cloud base height to 108 and ensure clouds stay within 108-112
    player:set_clouds({
        height = 108, -- Base height for clouds
        thickness = 8, -- Thickness to span y=108 to y=112
        density = 0.4, -- Default density for natural look
        speed = {x = 5, z = 0}, -- Gentle movement like Minecraft
    })
end)

-- Override global mapgen parameters to ensure consistency
minetest.register_on_mapgen_init(function()
    minetest.set_mapgen_setting("cloud_height", "108", true)
    minetest.set_mapgen_setting("cloud_thickness", "4", true)
end)

-- Periodically enforce cloud settings for all players
minetest.register_globalstep(function()
    for _, player in ipairs(minetest.get_connected_players()) do
        local cloud_params = player:get_clouds()
        if cloud_params.height ~= 108 or cloud_params.thickness ~= 4 then
            player:set_clouds({
                height = 108,
                thickness = 5,
                density = 0.3,
                speed = {x = 5, z = 0},
            })
        end
    end
end)
