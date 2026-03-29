local routetypes = require "business.routetypes"
local wallroutetype = require "business.routetypes.wallroutetype"
local doorroutetype = require "business.routetypes.doorroutetype"
local M = {}
local repository = {}
local function loadRouteType(routeTypeId, newRouteType)
    repository[routeTypeId] = newRouteType
end
function M.load()
    loadRouteType(routetypes.WALL, wallroutetype.create())
    loadRouteType(routetypes.DOOR, doorroutetype.create())
end
function M.getRouteType(routeTypeId)
    return repository[routeTypeId]
end
return M