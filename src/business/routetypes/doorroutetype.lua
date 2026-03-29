local routetype = require "business.routetype"
local M = {}
local function isPassableHandler(r,c)
    return true
end
function M.create()
    local instance = routetype.create(isPassableHandler)
    return instance
end
return M