local verbmanager = require "business.verbmanager"
local charactertypemanager = require "business.charactertypemanager"
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
    function instance:setLocation(newLocation)
        local l = self:getLocation()
        if l ~= nil then
            l:removeCharacter(self)
        end
        if newLocation~= nil then
            self:getCharacterData().locationId = newLocation:getLocationId()
        else
            self:getCharacterData().locationId = nil
        end
        l = self:getLocation()
        if l ~= nil then
            l:addCharacter(self)
        end
    end
    function instance:getCharacterType()
        return self:getCharacterData().characterType
    end
    function instance:initialize()
        charactertypemanager.getCharacterType(self:getCharacterType()):initialize(self)
    end
    return instance
end
return M