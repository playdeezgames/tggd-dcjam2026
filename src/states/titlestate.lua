local M = {}
local state = require("states.state")
local states = require("states.states")
local colors = require("ui.colors")
local commands = require("ui.commands")
local framebuffer     = require("ui.framebuffer")
local constants       = require("constants")
M.EMBARK = "embark"
M.ABOUT = "about"
M.OPTIONS = "options"
local function titleStateUpdateHandler(state, dt)
end
local function titleStateCommandHandler(state, command)
    if command == commands.GREEN then
        return states.MAIN_MENU
    end
    return nil
end
local function titleStateStartHandler(state)
    framebuffer.fill(0, 0, constants.CELL_COLUMNS, constants.CELL_ROWS, 1, colors.BLACK, colors.BLACK)
    framebuffer.writeText(0,0,"Sunny Meadows of SPLORR!!",colors.WHITE, colors.BLACK)
    framebuffer.writeText(0,1,"A production of TheGrumpyGameDev",colors.WHITE, colors.BLACK)
    framebuffer.writeText(0,2,"For Dungeon Crawler Jam 2026",colors.WHITE, colors.BLACK)
end
local function titleStateStopHandler(state)
end
function M.create()
    local instance = state.create(
        titleStateStartHandler, 
        titleStateStopHandler, 
        titleStateUpdateHandler, 
        titleStateCommandHandler)
    return instance
end
return M