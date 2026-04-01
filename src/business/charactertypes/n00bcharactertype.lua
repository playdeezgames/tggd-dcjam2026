local charactertype = require "business.charactertype"
local statistictypes= require "business.statistictypes"
local itemtypes     = require "business.itemtypes"
local M = {}
local SATIETY_MAXIMUM = 100
local HEALTH_MAXIMUM = 100
local function initializeHandler(c)
    c:setStatisticMinimum(statistictypes.SATIETY, 0)
    c:setStatisticMaximum(statistictypes.SATIETY, SATIETY_MAXIMUM)
    c:setStatistic(statistictypes.SATIETY, SATIETY_MAXIMUM/2)

    c:setStatisticMinimum(statistictypes.HEALTH, 0)
    c:setStatisticMaximum(statistictypes.HEALTH, HEALTH_MAXIMUM)
    c:setStatistic(statistictypes.HEALTH, HEALTH_MAXIMUM/2)

    c:setStatisticMinimum(statistictypes.STOMACH, 0)
    c:setStatistic(statistictypes.STOMACH, 0)

    c:getWorld():createItem(itemtypes.FOOD, c:getInventory())
    c:getWorld():createItem(itemtypes.FOOD, c:getInventory())
    c:getWorld():createItem(itemtypes.FOOD, c:getInventory())
end
function M.create()
    local instance = charactertype.create(initializeHandler)
    return instance
end
return M