local M = {}
local state = require("state")
local colors = require("colors")
local menu   = require("menu")
local menuitem = require("menuitem")
local function titleStateUpdateHandler(state, dt)
    state.menu:render()
end
local function titleStateCommandHandler(state, command)
    print("handle title state command: "..command)
end
local function titleStateStartHandler(state)
    state.menu = menu.create(0, 0, "Main Menu:", colors.BROWN, colors.BLACK)
    state.menu:addItem(menuitem.create("","Embark!",colors.WHITE, colors.BLACK))
    state.menu:addItem(menuitem.create("","About...",colors.WHITE, colors.BLACK))
    state.menu:addItem(menuitem.create("","Options...",colors.WHITE, colors.BLACK))
end
local function titleStateStopHandler(state)
    print("stop title state")
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