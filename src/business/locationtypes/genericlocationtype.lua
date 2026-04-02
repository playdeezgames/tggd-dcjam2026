local M = {}
local locationType = require "business.locationtype"
local statistictypes = require "business.statistictypes"
local function initializeHandler(l)
    l:setStatisticMinimum(statistictypes.FILTH, 0)
    l:setStatistic(statistictypes.FILTH, 100)--TODO: randomize filth?
end
function M.create()
    local instance = locationType.create(initializeHandler)
    return instance
end
return M