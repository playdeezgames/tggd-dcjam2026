local M = {}
local state = require("states.state")
local states = require("states.states")
local colors = require("ui.colors")
local commands = require("ui.commands")
local framebuffer     = require("ui.framebuffer")
M.EMBARK = "embark"
M.ABOUT = "about"
M.OPTIONS = "options"
local function updateHandler(state, dt)
end
local function commandHandler(state, command)
    if command == commands.GREEN then
        return states.MAIN_MENU
    end
    return nil
end
local function startHandler(state)
    framebuffer.clear(1, colors.BLACK, colors.BLACK)
    framebuffer.writeText(0,0,"Sunny Meadows of SPLORR!!",colors.WHITE, colors.BLACK)
    framebuffer.writeText(0,1,"A production of TheGrumpyGameDev",colors.WHITE, colors.BLACK)
    framebuffer.writeText(0,2,"For Dungeon Crawler Jam 2026",colors.WHITE, colors.BLACK)
end
local function stopHandler(state)
end
function M.create()
    local instance = state.create(
        startHandler, 
        stopHandler, 
        updateHandler, 
        commandHandler)
    return instance
end
return M