local version = "1.1.0"

local modpath = minetest.get_modpath("aratox")
aratox_checks = {}

local modules = {
--autohandle
"autohandle", 

--speed

"checks/speed-1",
--fly
"checks/fly-1",
"checks/fly-2",
}

for _, module in pairs(modules) do
    dofile(modpath .. "/" .. module .. ".lua")
end

minetest.register_chatcommand("aratox", {
    description = "Returns the current Version of the installed Aratox anticheat.",
    params = "",
    privs = {shout = true},
    func = function(playername, param)
        minetest.chat_send_player(playername, "Aratox Anticheat v" .. version .. " (~Zander, contentdb: @zanderdev)")
    end,
})

minetest.register_globalstep(function(dtime)
    --fly
    aratox_checks.fly_1()
    aratox_checks.fly_2()

    --speed
    aratox_checks.speed_1()

end)
