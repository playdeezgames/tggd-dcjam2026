local verb = require "business.verb"
local verbs = require "business.verbs"
local tags = require "business.tags"
local M = {}
local function performHandler(c)
    local l = c:getLocation()
    local r = l:getRoute(c:getFacing())
    if r:isPassable(c) then
        c:setLocation(r:getToLocation())
        c:perform(verbs.STARVE)
    end
end
local function canSelectHandler(c)
    return not c:getTag(tags.ACTION_MENU)
end
function M.create()
    local instance = verb.create("Move Ahead", performHandler, canSelectHandler)
    return instance
end
return M