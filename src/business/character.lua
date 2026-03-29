local verbmanager = require "business.verbmanager"
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
    function instance:setFacing(newFacing)
        self:getCharacterData().facing = newFacing
    end
    function instance:doVerb(verbId)
        local v = verbmanager.getVerb(verbId)
        v:perform(self)
    end
    return instance
end
return M