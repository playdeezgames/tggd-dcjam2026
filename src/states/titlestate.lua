local M = {}
local state = require("states.state")
local states = require("states.states")
local colors = require("ui.colors")
local menu   = require("ui.menu")
local menuitem = require("ui.menuitem")
local commands = require("ui.commands")
M.EMBARK = "embark"
M.ABOUT = "about"
M.OPTIONS = "options"
local function titleStateUpdateHandler(state, dt)
    state.menu:render()
end
local function menuItemHandler(state, itemId)
    if itemId == M.ABOUT then
        return states.ABOUT
    end
end
local function titleStateCommandHandler(state, command)
    if command == commands.UP then
        state.menu:previousItem()
    elseif command == commands.DOWN then
        state.menu:nextItem()
    elseif command == commands.GREEN then
        return menuItemHandler(state, state.menu:getCurrentItemId())
    end
    return nil
end
local function titleStateStartHandler(state)
    state.menu = menu.create(0, 0, "Main Menu:", colors.BROWN, colors.BLACK)
    state.menu:addItem(menuitem.create(M.EMBARK,"Embark!",colors.WHITE, colors.BLACK))
    state.menu:addItem(menuitem.create(M.ABOUT,"About...",colors.WHITE, colors.BLACK))
    state.menu:addItem(menuitem.create(M.OPTIONS,"Options...",colors.WHITE, colors.BLACK))
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