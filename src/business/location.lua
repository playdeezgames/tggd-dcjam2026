local M = {}
function M.create(data, locationId)
    local instance = {
        data = data,
        locationId = locationId
    }
    function instance:getLocationId()
        return self.locationId
    end
    function instance:getLocationData()
        return self.data.locations[self:getLocationId()]
    end
    return instance
end
return M