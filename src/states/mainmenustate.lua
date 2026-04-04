local states = require "states.states"
local worldmanager = require "business.worldmanager"
local neutral      = require "states.neutral"
local M = {}
M.EMBARK = "embark"
M.ABOUT = "about"
local menustate = require("states.menustate")
local menu = require("ui.menu")
local menuitem = require("ui.menuitem")
local colors = require("ui.colors")
local function createMainMenuHandler(state)
    local result = menu.create(0,0,"Main Menu", colors.BROWN, colors.BLACK)
    result:addItem(menuitem.create(M.EMBARK,"Embark!", colors.WHITE, colors.BLACK))
    result:addItem(menuitem.create(M.ABOUT,"About...", colors.WHITE, colors.BLACK))
    return result
end
local function mainMenuItemHandler(state,itemId)
    if itemId == M.EMBARK then
        local world = worldmanager.getWorld()
        world:initialize()
        return neutral.nextState(world)
    elseif itemId == M.ABOUT then
        return states.ABOUT
    end
    return nil
end
local function mainMenuCancelHandler(state)
    return nil
end
function M.create()
    local instance = menustate.create(
        createMainMenuHandler,
        mainMenuItemHandler,
        mainMenuCancelHandler)
    return instance
end
return M