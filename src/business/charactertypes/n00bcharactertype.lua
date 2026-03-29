local charactertype = require "business.charactertype"
local M = {}
local function initializeHandler(c)
    print("initialize n00b")
end
function M.create()
    local instance = charactertype.create(initializeHandler)
    return instance
end
return M