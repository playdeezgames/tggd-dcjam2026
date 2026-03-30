local verb = require "business.verb"
local verbs = require "business.verbs"
local M = {}
local function performHandler(c)
    local l = c:getLocation()
    local r = l:getRoute(c:getFacing())
    if r:isPassable(c) then
        c:setLocation(r:getToLocation())
        c:doVerb(verbs.STARVE)
    end
end
function M.create()
    local instance = verb.create(performHandler)
    return instance
end
return M