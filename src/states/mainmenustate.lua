local states = require "states.states"
local M = {}
M.EMBARK = "embark"
M.OPTIONS = "options"
M.ABOUT = "about"
M.KORDANOR = "kordanor"
local menustate = require("states.menustate")
local menu = require("ui.menu")
local menuitem = require("ui.menuitem")
local colors = require("ui.colors")
local function createMainMenuHandler(state)
    local result = menu.create(0,0,"Main Menu", colors.BROWN, colors.BLACK)
    result:addItem(menuitem.create(M.EMBARK,"Embark!", colors.WHITE, colors.BLACK))
    result:addItem(menuitem.create(M.OPTIONS,"Options...", colors.WHITE, colors.BLACK))
    result:addItem(menuitem.create(M.ABOUT,"About...", colors.WHITE, colors.BLACK))
    result:addItem(menuitem.create(M.KORDANOR,"Dear Kordanor...", colors.WHITE, colors.BLACK))
    return result
end
local function mainMenuItemHandler(state,itemId)
    if itemId == M.ABOUT then
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