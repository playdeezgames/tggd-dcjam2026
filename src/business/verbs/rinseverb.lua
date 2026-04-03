local verb = require "business.verb"
local yokes= require "business.yokes"
local itemtypemanager = require "business.itemtypemanager"
local itemtypes = require "business.itemtypes"
local tags = require "business.tags"
local M = {}
local function performHandler(c)
    local yokedItemId = c:getYoke(yokes.ITEM_ID)
    if yokedItemId == nil then
        return
    end
    local i = c:getWorld():getItem(yokedItemId)
    local it = itemtypemanager.getItemType(i:getItemType())
    c:setYoke(yokes.ITEM_ID)
    c:removeItem(i)
    i:recycle()
    c:getWorld():createItem(itemtypes.RAG, c:getInventory())
end
local function canSelectHandler(c)
    local yokedItemId = c:getYoke(yokes.ITEM_ID)
    if yokedItemId == nil then
        return false
    end
    local i = c:getWorld():getItem(yokedItemId)
    local it = itemtypemanager.getItemType(i:getItemType())
    local l = c:getLocation()
    return l:getTag(tags.DEEP_SINK) and (it.canRinse or false)
end
function M.create()
    local instance = verb.create("Rinse", performHandler, canSelectHandler)
    return instance
end
return M