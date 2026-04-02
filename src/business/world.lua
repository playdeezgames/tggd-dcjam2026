local worldinitializer = require "business.worldinitializer"
local location = require "business.location"
local character = require("business.character")
local route     = require("business.route")
local inventory = require("business.inventory")
local item      = require("business.item")
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
        self.data.inventories = {}
        self.data.locations = {}
        self.data.routes = {}
        self.data.items = {}
        self.data.recycled_items = {}
    end
    function instance:abandon()
        self:clear()
    end
    function instance:createLocation(locationType, column, row)
        local locationId = #self.data.locations + 1
        self.data.locations[locationId] = {
            locationType = locationType,
            column = column,
            row = row,
            characters = {},
            routes = {},
            statistics = {}
        }
        local result = self:getLocation(locationId)
        result:initialize()
        result:setName(string.char(64+column)..string.char(48+row))
        return result
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
            statistics = {},
            tags = {},
            metadatas = {},
            yokes = {}
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
    function instance:createItem(itemType, toInventory)
        local itemId = #self.data.items + 1
        local inventoryId = toInventory:getInventoryId()
        self.data.items[itemId] = {
            itemType = itemType,
            inventoryId = inventoryId
        }
        local result = item.create(self.data, itemId, self)
        toInventory:addItem(result)
        result:initialize()
        return result
    end
    function instance:getItem(itemId)
        return item.create(self.data, itemId, self)
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
    function instance:createInventory()
        local inventoryId = #self.data.inventories + 1
        self.data.inventories[inventoryId] = {
            items = {}
        }
        return self:getInventory(inventoryId)
    end
    function instance:getInventory(inventoryId)
        return inventory.create(self.data, inventoryId, self)
    end
    return instance
end
return M