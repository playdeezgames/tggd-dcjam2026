local verb = require "business.verb"
local tags = require "business.tags"
local statistictypes = require "business.statistictypes"
local M = {}
local function performHandler(c)
    c:setStatistic(statistictypes.ENERGY, c:getStatisticMaximum(statistictypes.ENERGY))
end
local function canSelectHandler(c)
    local l = c:getLocation()
    return l:getTag(tags.BED) and c:getStatistic(statistictypes.ENERGY) < c:getStatisticMaximum(statistictypes.ENERGY)
end
function M.create()
    local instance = verb.create("Rest", performHandler, canSelectHandler)
    return instance
end
return M