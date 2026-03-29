local M = {}
function M.create(data, characterId, w)
    local instance = {
        data = data,
        characterId = characterId,
        world = w
    }
    function instance:getCharacterId()
        return self.characterId
    end
    function instance:getCharacterData()
        return self.data.characters[self:getCharacterId()]
    end
    function instance:getLocation()
        local characterData = self:getCharacterData()
        local locationId = characterData.locationId
        return self.world:getLocation(locationId)
    end
    function instance:getFacing()
        return self:getCharacterData().facing
    end
    return instance
end
return M