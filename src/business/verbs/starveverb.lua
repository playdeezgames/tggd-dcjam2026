local verb = require "business.verb"
local statistictypes = require "business.statistictypes"
local M = {}
local function performHandler(c)
    local satiety = c:getStatistic(statistictypes.SATIETY)
    if satiety == nil then
        return
    end
    local minimumSatiety = c:getStatisticMinimum(statistictypes.SATIETY)
    if satiety > minimumSatiety then
        satiety = satiety - 1
        c:setStatistic(statistictypes.SATIETY, satiety)
    else
        local health = c:getStatistic(statistictypes.HEALTH)
        assert(health, "all characters should have health")
        local minimumHealth = c:getStatisticMinimum(statistictypes.HEALTH)
        assert(minimumHealth, "all characters should have a minimum health")
        if health > minimumHealth then
            health = health - 1
            c:setStatistic(statistictypes.HEALTH, health)
        end
    end
end
function M.create()
    local instance = verb.create(performHandler)
    return instance
end
return M