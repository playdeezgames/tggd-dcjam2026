local M = {}
local states = require("states.states")
local statistictypes = require("business.statistictypes")
function M.nextState(w)
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    local health = avatar:getStatistic(statistictypes.HEALTH)
    local minimumHealth = avatar:getStatisticMinimum(statistictypes.HEALTH)
    if health <= minimumHealth then
        return states.GAME_OVER
    end
    return states.NAVIGATION
end
return M