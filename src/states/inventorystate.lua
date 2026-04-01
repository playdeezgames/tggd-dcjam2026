local worldmanager = require "business.worldmanager"
local menu = require "ui.menu"
local colors = require "ui.colors"
local neutral = require "states.neutral"
local menuitem = require "ui.menuitem"
local tags     = require "business.tags"
local metadatas= require "business.metadatas"
local M = {}
M.NEVER_MIND = "never mind"
local menustate = require "states.menustate"
local function createMenuHandler(state)
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    local result = menu.create(0,0,"Inventory", colors.BROWN, colors.BLACK)
    result:addItem(menuitem.create(M.NEVER_MIND,"Never Mind", colors.WHITE, colors.BLACK))

    for _, itemStack in ipairs(avatar:getInventory():getItemStacks()) do
        result:addItem(menuitem.create(itemStack:getItemType(),itemStack:getItemName(), colors.WHITE, colors.BLACK))
    end

    return result
end
local function itemHandler(state,menuItemId)
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    if menuItemId == M.NEVER_MIND then
        avatar:clearTag(tags.INVENTORY)
        avatar:setTag(tags.ACTION_MENU)
    else
        avatar:setMetadata(metadatas.ITEM_STACK_TYPE, menuItemId)
    end
    return neutral.nextState(w)
end
local function cancelHandler(state)
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    avatar:clearTag(tags.INVENTORY)
    avatar:setTag(tags.ACTION_MENU)
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