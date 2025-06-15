-- Global namespace for functions
fire = {}

-- Load support for MT game translation.
local S = minetest.get_translator("fire")

-- Enable fire setting
local fire_enabled = minetest.settings:get_bool("enable_fire")
if fire_enabled == nil then
    local fire_disabled = minetest.settings:get_bool("disable_fire")
    if fire_disabled == nil then
        fire_enabled = minetest.is_singleplayer()
    else
        fire_enabled = not fire_disabled
    end
end

-- Define custom sounds
local sound_tool_breaks = {name = "tool_breaks", gain = 0.5}
local sound_extinguish = {name = "fire_extinguish_flame", gain = 0.15}
local sound_flint_and_steel = {name = "fire_flint_and_steel", gain = 0.2}
local sound_fire = {name = "fire_fire", gain = 0.06} -- Base gain, adjusted in code

-- Flood flame function
local function flood_flame(pos, _, newnode)
    if minetest.get_item_group(newnode.name, "igniter") == 0 then
        minetest.sound_play(sound_extinguish, {pos = pos, max_hear_distance = 16}, true)
    end
    return false
end

-- Flame nodes
local fire_node = {
    drawtype = "firelike",
    tiles = {{
        name = "fire_basic_flame_animated.png",
        animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 1
        }}
    },
    inventory_image = "fire_basic_flame.png",
    paramtype = "light",
    light_source = 13,
    walkable = false,
    buildable_to = true,
    sunlight_propagates = true,
    floodable = true,
    damage_per_second = 4,
    groups = {igniter = 2, dig_immediate = 3, fire = 1},
    drop = "",
    on_flood = flood_flame
}

-- Basic flame node
local flame_fire_node = table.copy(fire_node)
flame_fire_node.description = S("Fire")
flame_fire_node.groups.not_in_creative_inventory = 1
flame_fire_node.on_timer = function(pos)
    if not minetest.find_node_near(pos, 1, {"group:flammable"}) then
        minetest.remove_node(pos)
        return
    end
    return true
end
flame_fire_node.on_construct = function(pos)
    minetest.get_node_timer(pos):start(math.random(30, 60))
end

minetest.register_node("fire:basic_flame", flame_fire_node)

-- Permanent flame node
local permanent_fire_node = table.copy(fire_node)
permanent_fire_node.description = S("Permanent Fire")

minetest.register_node("fire:permanent_flame", permanent_fire_node)

-- Flint and Steel
minetest.register_tool("fire:flint_and_steel", {
    description = S("Flint and Steel"),
    inventory_image = "fire_flint_steel.png",
    sound = {breaks = sound_tool_breaks},

    on_use = function(itemstack, user, pointed_thing)
        local sound_pos = pointed_thing.above or user:get_pos()
        minetest.sound_play(sound_flint_and_steel, {pos = sound_pos, max_hear_distance = 8}, true)
        local player_name = user:get_player_name()
        if pointed_thing.type == "node" then
            local node_under = minetest.get_node(pointed_thing.under).name
            local nodedef = minetest.registered_nodes[node_under]
            if not nodedef then
                return
            end
            if minetest.is_protected(pointed_thing.under, player_name) then
                minetest.record_protection_violation(pointed_thing.under, player_name)
                return
            end
            if nodedef.on_ignite then
                nodedef.on_ignite(pointed_thing.under, user)
            elseif minetest.get_item_group(node_under, "flammable") >= 1
                    and minetest.get_node(pointed_thing.above).name == "air" then
                if minetest.is_protected(pointed_thing.above, player_name) then
                    minetest.record_protection_violation(pointed_thing.above, player_name)
                    return
                end
                minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
            end
        end
        if not minetest.is_creative_enabled(player_name) then
            local wdef = itemstack:get_definition()
            itemstack:add_wear_by_uses(66)
            if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
                minetest.sound_play(wdef.sound.breaks, {pos = sound_pos}, true)
            end
            return itemstack
        end
    end
})

minetest.register_craft({
    output = "fire:flint_and_steel",
    recipe = {
        {"flint", "steel_ingot"}
    }
})

-- Sound handling
local flame_sound = minetest.settings:get_bool("flame_sound", true)

if flame_sound then
    local handles = {}
    local timer = 0
    local radius = 8
    local cycle = 3

    function fire.update_player_sound(player)
        local player_name = player:get_player_name()
        local ppos = player:get_pos()
        local areamin = vector.subtract(ppos, radius)
        local areamax = vector.add(ppos, radius)
        local fpos, num = minetest.find_nodes_in_area(
            areamin,
            areamax,
            {"fire:basic_flame", "fire:permanent_flame"}
        )
        local flames = (num["fire:basic_flame"] or 0) + (num["fire:permanent_flame"] or 0)
        if handles[player_name] then
            minetest.sound_stop(handles[player_name])
            handles[player_name] = nil
        end
        if flames > 0 then
            local fposmid = fpos[1]
            if #fpos > 1 then
                local fposmin = areamax
                local fposmax = areamin
                for i = 1, #fpos do
                    local fposi = fpos[i]
                    if fposi.x > fposmax.x then fposmax.x = fposi.x end
                    if fposi.y > fposmax.y then fposmax.y = fposi.y end
                    if fposi.z > fposmax.z then fposmax.z = fposi.z end
                    if fposi.x < fposmin.x then fposmin.x = fposi.x end
                    if fposi.y < fposmin.y then fposmin.y = fposi.y end
                    if fposi.z < fposmin.z then fposmin.z = fposi.z end
                end
                fposmid = vector.divide(vector.add(fposmin, fposmax), 2)
            end
            local gain = math.min(sound_fire.gain * (1 + flames * 0.125), 0.18)
            local handle = minetest.sound_play(sound_fire.name, {
                pos = fposmid,
                to_player = player_name,
                gain = gain,
                max_hear_distance = 32,
                loop = true
            }, true)
            if handle then
                handles[player_name] = handle
            end
        end
    end

    minetest.register_globalstep(function(dtime)
        timer = timer + dtime
        if timer < cycle then
            return
        end
        timer = 0
        local players = minetest.get_connected_players()
        for n = 1, #players do
            fire.update_player_sound(players[n])
        end
    end)

    minetest.register_on_leaveplayer(function(player)
        local player_name = player:get_player_name()
        if handles[player_name] then
            minetest.sound_stop(handles[player_name])
            handles[player_name] = nil
        end
    end)
end

function fire.update_sounds_around() end

-- ABMs
if fire_enabled then
    minetest.register_abm({
        label = "Ignite flame",
        nodenames = {"group:flammable"},
        neighbors = {"group:igniter"},
        interval = 7,
        chance = 12,
        catch_up = false,
        action = function(pos)
            local p = minetest.find_node_near(pos, 1, {"air"})
            if p then
                minetest.set_node(p, {name = "fire:basic_flame"})
            end
        end
    })

    minetest.register_abm({
        label = "Remove flammable nodes",
        nodenames = {"fire:basic_flame"},
        neighbors = "group:flammable",
        interval = 5,
        chance = 18,
        catch_up = false,
        action = function(pos)
            local p = minetest.find_node_near(pos, 1, {"group:flammable"})
            if not p then
                return
            end
            local flammable_node = minetest.get_node(p)
            local def = minetest.registered_nodes[flammable_node.name]
            if def.on_burn then
                def.on_burn(p)
            else
                minetest.remove_node(p)
                minetest.check_for_falling(p)
            end
        end
    })
end
