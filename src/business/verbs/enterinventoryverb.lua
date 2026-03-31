local verb = require "business.verb"
local tags = require "business.tags"
local M = {}
local function performHandler(c)
end
local function canSelectHandler(c)
    return c:getTag(tags.ACTION_MENU) and c:getInventory():hasItems()
end
function M.create()
    local instance = verb.create("Inventory...", performHandler, canSelectHandler)
    return instance
end
return M