local verb = require "business.verb"
local cardinalwalker = require "utility.cardinalwalker"
local M = {}
local function performHandler(c)
    c:setFacing(cardinalwalker.getRight(c:getFacing()))
end
function M.create()
    local instance = verb.create(performHandler)
    return instance
end
return M