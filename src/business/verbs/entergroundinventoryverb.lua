local verb = require "business.verb"
local tags = require "business.tags"
local M = {}
local function performHandler(c)
    c:clearTag(tags.ACTION_MENU)
    c:setTag(tags.GROUND_INVENTORY)
end
local function canSelectHandler(c)
    return c:getTag(tags.ACTION_MENU) and c:getLocation():hasItems()
end
function M.create()
    local instance = verb.create("Ground...", performHandler, canSelectHandler)
    return instance
end
return M