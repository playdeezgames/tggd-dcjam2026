local itemtype = require "business.itemtype"
local M = {}
local function initializeHandler(i)
    print("initializing food!")
end
function M.create()
    local instance = itemtype.create(initializeHandler)
    return instance
end
return M