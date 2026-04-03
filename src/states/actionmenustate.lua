local worldmanager = require "business.worldmanager"
local neutral      = require "states.neutral"
local tags         = require "business.tags"
local verbs        = require "business.verbs"
local verbmanager  = require "business.verbmanager"
local M = {}
M.VERBS = {
    verbs.LEAVE_ACTION_MENU,
    verbs.ENTER_INVENTORY,
    verbs.REST
}
local menustate = require("states.menustate")
local menu = require("ui.menu")
local menuitem = require("ui.menuitem")
local colors = require("ui.colors")
local function createMenuHandler(state)
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    local result = menu.create(0,0,"Action Menu", colors.BROWN, colors.BLACK)
    for _, v in ipairs(M.VERBS) do
        if avatar:canSelect(v) then
            result:addItem(menuitem.create(v,verbmanager.getVerb(v):getText(), colors.WHITE, colors.BLACK))
        end
    end
    return result
end
local function itemHandler(state,itemId)
    local w = worldmanager.getWorld()
    w:getAvatar():perform(itemId)
    return neutral.nextState(w)
end
local function cancelHandler(state)
    local w = worldmanager.getWorld()
    w:getAvatar():clearTag(tags.ACTION_MENU)
    return neutral.nextState(w)
end
function M.create()
    local instance = menustate.create(
        createMenuHandler,
        itemHandler,
        cancelHandler)
    return instance
end
return M