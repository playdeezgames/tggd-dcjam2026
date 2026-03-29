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
    return instance
end
return M