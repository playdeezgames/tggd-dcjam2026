local routetypemanager = require "business.routetypemanager"
local M = {}
function M.create(data, routeId, w)
    local instance = {
        data = data,
        routeId = routeId,
        world = w
    }
    function instance:getRouteId()
        return self.routeId
    end
    function instance:getRouteData()
        return self.data.routes[self:getRouteId()]
    end
    function instance:getRouteType()
        return self:getRouteData().routeType
    end
    function instance:isPassable(c)
        local rt = routetypemanager.getRouteType(self:getRouteType())
        return rt:isPassable(self, c)
    end
    function instance:getToLocation()
        local toLocationId = self:getRouteData().toLocationId
        if toLocationId ~= nil then
            return self.world:getLocation(toLocationId)
        end
        return nil
    end
    function instance:getLeftPrefab()
        local rt = routetypemanager.getRouteType(self:getRouteType())
        return rt:getLeftPrefab(self)
    end
    function instance:getRightPrefab()
        local rt = routetypemanager.getRouteType(self:getRouteType())
        return rt:getRightPrefab(self)
    end
    function instance:getAheadPrefab()
        local rt = routetypemanager.getRouteType(self:getRouteType())
        return rt:getAheadPrefab(self)
    end
    return instance
end
return M