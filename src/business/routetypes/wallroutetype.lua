local routetype = require "business.routetype"
local prefabs   = require "ui.prefabs"
local M = {}
local function isPassableHandler(r,c)
    return false
end
function M.create()
    local instance = routetype.create(prefabs.LEFT_WALL, prefabs.AHEAD_WALL, prefabs.RIGHT_WALL, isPassableHandler)
    return instance
end
return M