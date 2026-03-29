local worldinitializer = require "business.worldinitializer"
local location = require "business.location"
local character = require("business.character")
local route     = require("business.route")
local M = {}
function M.create(data)
    local instance = {}
    instance.data = data
    function instance:initialize()
        worldinitializer.initialize(self)
    end
    function instance:clear()
        self.data.avatarId = nil
        self.data.characters = {}
        self.data.locations = {}
        self.data.routes = {}
    end
    function instance:createLocation(locationType, column, row)
        local locationId = #self.data.locations + 1
        self.data.locations[locationId] = {
            locationType = locationType,
            column = column,
            row = row,
            characters = {},
            routes = {}
        }
        return self:getLocation(locationId)
    end
    function instance:getLocation(locationId)
        return location.create(self.data, locationId, self)
    end
    function instance:createCharacter(characterType, initialLocation, facing)
        local characterId = #self.data.characters + 1
        self.data.characters[characterId] = {
            characterType = characterType,
            locationId = initialLocation:getLocationId(),
            facing = facing,
            statistics = {}
        }
        local result = self:getCharacter(characterId)
        initialLocation:addCharacter(result)
        result:initialize()
        return result
    end
    function instance:getCharacter(characterId)
        return character.create(self.data, characterId, self)
    end
    function instance:createRoute(routeType, direction, fromLocation, toLocation)
        local routeId = #self.data.routes + 1
        local toLocationId = nil
        if toLocation ~= nil then
            toLocationId = toLocation:getLocationId()
        end
        self.data.routes[routeId] = {
            routeType = routeType,
            toLocationId = toLocationId
        }
        local result = route.create(self.data, routeId, self)
        fromLocation:setRoute(direction, result)
        return result
    end
    function instance:getRoute(routeId)
        return route.create(self.data, routeId, self)
    end
    function instance:setAvatar(avatar)
        if avatar ~= nil then
            self.data.avatarId = avatar:getCharacterId()
        else
            self.data.avatarId = nil
        end
    end
    function instance:getAvatar()
        local avatarId = self.data.avatarId
        if avatarId ~= nil then
            return self:getCharacter(avatarId)
        end
        return nil
    end
    return instance
end
return M