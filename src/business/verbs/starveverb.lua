local verb = require "business.verb"
local statistictypes = require "business.statistictypes"
local tags = require "business.tags"
local M = {}
local function performHandler(c)
    local satiety = c:getStatistic(statistictypes.SATIETY)
    if satiety == nil then
        return
    end
    local stomach = c:getStatistic(statistictypes.STOMACH)
    local delta = -1
    if stomach > 0 then
        delta = 1
        c:setStatistic(statistictypes.STOMACH, stomach - 1)
    end
    if delta < 0 then
        local minimumSatiety = c:getStatisticMinimum(statistictypes.SATIETY)
        if satiety > minimumSatiety then
            satiety = satiety + delta
            c:setStatistic(statistictypes.SATIETY, satiety)
        else
            local health = c:getStatistic(statistictypes.HEALTH)
            assert(health, "all characters should have health")
            local minimumHealth = c:getStatisticMinimum(statistictypes.HEALTH)
            assert(minimumHealth, "all characters should have a minimum health")
            if health > minimumHealth then
                health = health + delta
                c:setStatistic(statistictypes.HEALTH, health)
            end
        end
    else
        local maximumSatiety = c:getStatisticMaximum(statistictypes.SATIETY)
        if satiety < maximumSatiety then
            satiety = satiety + delta
            c:setStatistic(statistictypes.SATIETY, satiety)
        else
            local health = c:getStatistic(statistictypes.HEALTH)
            health = health + delta
            c:setStatistic(statistictypes.HEALTH, health)
        end
    end
end
local function canSelectHandler(c)
    return not c:getTag(tags.ACTION_MENU)
end
function M.create()
    local instance = verb.create("Starve!", performHandler, canSelectHandler)
    return instance
end
return M