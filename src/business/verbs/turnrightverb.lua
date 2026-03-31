local verb = require "business.verb"
local cardinalwalker = require "utility.cardinalwalker"
local tags = require "business.tags"
local M = {}
local function performHandler(c)
    c:setFacing(cardinalwalker.getRight(c:getFacing()))
end
local function canSelectHandler(c)
    return not c:getTag(tags.ACTION_MENU)
end
function M.create()
    local instance = verb.create("Turn Right", performHandler, canSelectHandler)
    return instance
end
return M