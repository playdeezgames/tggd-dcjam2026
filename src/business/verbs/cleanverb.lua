local verb = require "business.verb"
local yokes= require "business.yokes"
local itemtypemanager = require "business.itemtypemanager"
local statistictypes  = require "business.statistictypes"
local itemtypes       = require "business.itemtypes"
local M = {}
local function performHandler(c)
    local yokedItemId = c:getYoke(yokes.ITEM_ID)
    if yokedItemId == nil then
        return
    end
    local i = c:getWorld():getItem(yokedItemId)
    local it = itemtypemanager.getItemType(i:getItemType())
    local filthRemoved = it.filth
    local l = c:getLocation()
    local roomFilth = l:getStatistic(statistictypes.FILTH) or 0
    roomFilth = roomFilth - filthRemoved
    l:setStatistic(statistictypes.FILTH, roomFilth)
    c:changeStatistic(statistictypes.ENERGY, -1)
    c:setYoke(yokes.ITEM_ID)
    c:removeItem(i)
    i:recycle()
    c:getWorld():createItem(itemtypes.FILTHY_RAG, c:getInventory())
end
local function canSelectHandler(c)
    local yokedItemId = c:getYoke(yokes.ITEM_ID)
    if yokedItemId == nil then
        return false
    end
    local i = c:getWorld():getItem(yokedItemId)
    local it = itemtypemanager.getItemType(i:getItemType())
    local l = c:getLocation()
    local roomFilth = l:getStatistic(statistictypes.FILTH) or 0
    return c:getStatistic(statistictypes.ENERGY) > c:getStatisticMinimum(statistictypes.ENERGY) and roomFilth > 0 and (it.canClean or false)
end
function M.create()
    local instance = verb.create("Clean", performHandler, canSelectHandler)
    return instance
end
return M