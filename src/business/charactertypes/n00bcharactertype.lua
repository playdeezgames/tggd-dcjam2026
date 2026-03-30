local charactertype = require "business.charactertype"
local statistictypes= require "business.statistictypes"
local M = {}
local SATIETY_MAXIMUM = 100
local HEALTH_MAXIMUM = 100
local function initializeHandler(c)
    c:setStatisticMinimum(statistictypes.SATIETY, 0)
    c:setStatisticMaximum(statistictypes.SATIETY, SATIETY_MAXIMUM)
    c:setStatistic(statistictypes.SATIETY, SATIETY_MAXIMUM)

    c:setStatisticMinimum(statistictypes.HEALTH, 0)
    c:setStatisticMaximum(statistictypes.HEALTH, HEALTH_MAXIMUM)
    c:setStatistic(statistictypes.HEALTH, HEALTH_MAXIMUM)
end
function M.create()
    local instance = charactertype.create(initializeHandler)
    return instance
end
return M