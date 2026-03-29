local M = {}
function M.create(data, locationId, w)
    local instance = {
        data = data,
        locationId = locationId,
        world = w
    }
    function instance:getLocationId()
        return self.locationId
    end
    function instance:getLocationData()
        return self.data.locations[self:getLocationId()]
    end
    function instance:addCharacter(addedCharacter)
        self:getLocationData().characters[addedCharacter:getCharacterId()] = true
    end
    function instance:removeCharacter(removedCharacter)
        self:getLocationData().characters[removedCharacter:getCharacterId()] = nil
    end
    function instance:setRoute(direction, newRoute)
        if newRoute ~= nil then
            self:getLocationData().routes[direction] = newRoute:getRouteId()
        else
            self:getLocationData().routes[direction] = nil
        end
    end
    function instance:getRoute(direction)
        local routeId = self:getLocationData().routes[direction]
        if routeId ~= nil then
            return self.world:getRoute(routeId)
        end
        return nil
    end
    return instance
end
return M