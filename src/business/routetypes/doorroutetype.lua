local routetype = require "business.routetype"
local prefabs = require "ui.prefabs"
local M = {}
local function isPassableHandler(r,c)
    return true
end
function M.create()
    local instance = routetype.create(prefabs.LEFT_DOOR, prefabs.AHEAD_DOOR, prefabs.RIGHT_DOOR, isPassableHandler)
    return instance
end
return M