local M = {}
local locationType = require "business.locationtype"
local function initializeHandler(l)
    
end
function M.create()
    local instance = locationType.create(initializeHandler)
    return instance
end
return M