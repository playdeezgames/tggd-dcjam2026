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
    function instance:addCharacter(addedCharacter)
        self:getLocationData().characters[addedCharacter:getCharacterId()] = true
    end
    function instance:removeCharacter(removedCharacter)
        self:getLocationData().characters[removedCharacter:getCharacterId()] = nil
    end
    return instance
end
return M