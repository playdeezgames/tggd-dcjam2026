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
    function instance:setStatisticMinimum(statisticTypeId, minimum)
        local characterData = self:getCharacterData()
        if characterData.statistics[statisticTypeId] == nil then
            characterData.statistics[statisticTypeId] = {}
        end
        characterData.statistics[statisticTypeId].minimum = minimum
    end
    function instance:setStatisticMaximum(statisticTypeId, maximum)
        local characterData = self:getCharacterData()
        if characterData.statistics[statisticTypeId] == nil then
            characterData.statistics[statisticTypeId] = {}
        end
        characterData.statistics[statisticTypeId].maximum = maximum
    end
    function instance:setStatistic(statisticTypeId, value)
        local characterData = self:getCharacterData()
        if characterData.statistics[statisticTypeId] == nil then
            characterData.statistics[statisticTypeId] = {}
        end
        characterData.statistics[statisticTypeId].value = value
    end
    function instance:getStatistic(statisticTypeId)
        local characterData = self:getCharacterData()
        if characterData.statistics[statisticTypeId] == nil then
            return nil
        end
        return characterData.statistics[statisticTypeId].value
    end
    function instance:getStatisticMaximum(statisticTypeId)
        local characterData = self:getCharacterData()
        if characterData.statistics[statisticTypeId] == nil then
            return nil
        end
        return characterData.statistics[statisticTypeId].maximum
    end
    function instance:getStatisticMinimum(statisticTypeId)
        local characterData = self:getCharacterData()
        if characterData.statistics[statisticTypeId] == nil then
            return nil
        end
        return characterData.statistics[statisticTypeId].minimum
    end
    return instance
end
return M