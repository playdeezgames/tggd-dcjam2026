local M = {}
local states = require("states.states")
function M.nextState(world)
    return states.NAVIGATION
end
return M