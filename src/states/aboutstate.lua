local M = {}
M.OK = "ok"
M.CANCEL = "cancel"
local menustate = require("states.menustate")
local menu = require("ui.menu")
local menuitem = require("ui.menuitem")
local colors = require("ui.colors")
local states = require("states.states")
local function createAboutMenuHandler(state)
    local result = menu.create(0,0,"About", colors.BROWN, colors.BLACK)
    result:addItem(menuitem.create(M.OK,"OK", colors.WHITE, colors.BLACK))
    result:addItem(menuitem.create(M.CANCEL,"Cancel", colors.WHITE, colors.BLACK))
    return result
end
local function aboutMenuItemHandler(state, itemId)
    if itemId == M.OK then
        return states.TITLE
    elseif itemId == M.CANCEL then
        return states.TITLE
    end
    return nil
end
local function aboutCancelHandler(state)
    return nil
end
function M.create()
    local instance = menustate.create(createAboutMenuHandler, aboutMenuItemHandler, aboutCancelHandler)
    return instance
end
return M