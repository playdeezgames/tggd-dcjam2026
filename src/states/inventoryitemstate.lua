local metadatas = require "business.metadatas"
local neutral   = require "states.neutral"
local itemtypemanager = require "business.itemtypemanager"
local yokes           = require "business.yokes"
local M = {}
M.NEVER_MIND = "never mind"
local menustate = require "states.menustate"
local worldmanager = require "business.worldmanager"
local menu = require "ui.menu"
local menuitem = require "ui.menuitem"
local colors = require "ui.colors"
local function createMenuHandler(state)
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")

    local itemId = avatar:getYoke(yokes.ITEM_ID)
    local i = w:getItem(itemId)

    local result = menu.create(0,0,i:getName(), colors.BROWN, colors.BLACK)
    result:addItem(menuitem.create(M.NEVER_MIND,"Never Mind", colors.WHITE, colors.BLACK))

    return result
end
local function itemHandler(state,menuItemId)
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    if menuItemId == M.NEVER_MIND then
        avatar:setYoke(yokes.ITEM_ID, nil)
    end
    return neutral.nextState(w)
end
local function cancelHandler(state)
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    avatar:setYoke(yokes.ITEM_ID, nil)
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