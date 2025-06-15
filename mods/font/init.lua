-- Mod: Custom Font (mc_font)
-- Description: Sets mc.otf as the default font for Minetest 3.4

minetest.log("action", "[mc_font] Loading custom font mod")

-- Attempt to get mod path; fallback to manual path resolution if unavailable
local mod_name = "font"
local mod_path = minetest.get_modpath and minetest.get_modpath(mod_name)
if not mod_path then
    -- Fallback: Assume mod is in games/minecraft/mods/font
    mod_path = minetest.get_mod_dir() .. "/games/minecraft/mods/" .. mod_name
end

-- Path to the font file
local font_path = mod_path .. "/fonts/mc.otf"

-- Check if the font file exists
local file = io.open(font_path, "r")
if file then
    file:close()
    -- Set the font (Minetest 3.4 may use different setting)
    minetest.settings:set("font_path", font_path) -- Fallback for older versions
    minetest.log("action", "[mc_font] Set font to " .. font_path)
else
    minetest.log("error", "[mc_font] Font file not found at " .. font_path)
end