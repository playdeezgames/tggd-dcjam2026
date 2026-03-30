local M = {}
local states = require("states.states")
local statistictypes = require("business.statistictypes")
local tags           = require("business.tags")
function M.nextState(w)
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    local health = avatar:getStatistic(statistictypes.HEALTH)
    local minimumHealth = avatar:getStatisticMinimum(statistictypes.HEALTH)
    if health <= minimumHealth then
        return states.GAME_OVER
    end
    if avatar:getTag(tags.ACTION_MENU) then
        return states.ACTION_MENU
    end
    return states.NAVIGATION
end
return M