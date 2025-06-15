-- Use both cobble and mossycobble in dungeon generation

-- Main dungeon wall
minetest.register_alias("mapgen_mossycobble", "minecraft:cobble")

-- Alternate wall block that gets randomly mixed in
minetest.register_alias("mapgen_cobble", "minecraft:mossycobble")

-- Optional: stairs used in dungeons
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")

