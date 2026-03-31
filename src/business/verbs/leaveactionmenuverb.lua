local verb = require "business.verb"
local tags = require "business.tags"
local M = {}
local function performHandler(c)
    c:clearTag(tags.ACTION_MENU)
end
local function canSelectHandler(c)
    return c:getTag(tags.ACTION_MENU)
end
function M.create()
    local instance = verb.create("Never Mind", performHandler, canSelectHandler)
    return instance
end
return M