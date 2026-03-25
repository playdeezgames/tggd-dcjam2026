local M = {}
local state = require("state")
local function titleStateUpdateHandler(state, dt)
end
local function titleStateCommandHandler(state, command)
    print("handle title state command: "..command)
end
local function titleStateStartHandler(state)
    print("start title state")
end
local function titleStateStopHandler(state)
    print("stop title state")
end
function M.create()
    local instance = state.create(
        titleStateStartHandler, 
        titleStateStopHandler, 
        titleStateUpdateHandler, 
        titleStateCommandHandler)
    return instance
end
return M