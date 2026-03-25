local M = {}
local state = require("state")
local function menuStateStartHandler(state)
end
local function menuStateStopHandler(state)
end
local function menuStateUpdateHandler(state, dt)
end
local function menuStateCommandHandler(state, command)
    return nil
end
function M.create()
    local instance = state.create(
        menuStateStartHandler, 
        menuStateStopHandler, 
        menuStateUpdateHandler, 
        menuStateCommandHandler)
    return instance
end
return M