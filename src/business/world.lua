local worldinitializer = require "business.worldinitializer"
local location = require "business.location"
local character = require("business.character")
local M = {}
function M.create(data)
    local instance = {}
    instance.data = data
    function instance:initialize()
        worldinitializer.initialize(self)
    end
    function instance:clear()
        self.avatarId = nil
        self.characters = {}
        self.locations = {}
    end
    function instance:createLocation(locationType, column, row)
        local locationId = #self.data.locations + 1
        self.data.locations[locationId] = {
            locationType = locationType,
            column = column,
            row = row
        }
        return location.create(self.data, locationId)
    end
    function instance:createCharacter(characterType, location, facing)
        local characterId = #self.data.characters + 1
        self.data.characters[characterId] = {
            characterType = characterType,
            locationId = location:getLocationId(),
            facing = facing
        }
        return character.create(self.data, characterId)
    end
    function instance:setAvatar(avatar)
        if avatar ~= nil then
            self.data.avatarId = avatar:getCharacterId()
        else
            self.data.avatarId = nil
        end
    end
    return instance
end
return M