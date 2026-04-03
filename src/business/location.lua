local locationtypemanager = require("business.locationtypemanager")
local M = {}
function M.create(data, locationId, w)
    local instance = {
        data = data,
        locationId = locationId,
        world = w
    }
    function instance:setName(newName)
        self:getLocationData().name = newName
    end
    function instance:getName()
        return self:getLocationData().name
    end
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
    function instance:getInventory()
        local locationData = self:getLocationData()
        local inventoryId = locationData.inventoryId
        if inventoryId ~= nil then
            return self.world:getInventory(inventoryId)
        else
            local i = self.world:createInventory()
            locationData.inventoryId = i:getInventoryId()
            return i
        end
    end
    function instance:getLocationType()
        return self:getLocationData().locationType
    end
    function instance:initialize()
        local lt = locationtypemanager.getLocationType(self:getLocationType())
        lt:initialize(self)
    end
    function instance:getStatistic(statisticTypeId)
        local locationData = self:getLocationData()
        if locationData.statistics[statisticTypeId] == nil then
            return nil
        end
        local result = locationData.statistics[statisticTypeId].value
        local maximum = self:getStatisticMaximum(statisticTypeId)
        if maximum ~= nil and result > maximum then
            result = maximum
        end
        local minimum = self:getStatisticMinimum(statisticTypeId)
        if minimum ~= nil and result < minimum then
            result = minimum
        end
        return result
    end
    function instance:getStatisticMaximum(statisticTypeId)
        local locationData = self:getLocationData()
        if locationData.statistics[statisticTypeId] == nil then
            return nil
        end
        return locationData.statistics[statisticTypeId].maximum
    end
    function instance:getStatisticMinimum(statisticTypeId)
        local locationData = self:getLocationData()
        if locationData.statistics[statisticTypeId] == nil then
            return nil
        end
        return locationData.statistics[statisticTypeId].minimum
    end
    function instance:setStatisticMinimum(statisticTypeId, minimum)
        local locationData = self:getLocationData()
        if locationData.statistics[statisticTypeId] == nil then
            locationData.statistics[statisticTypeId] = {}
        end
        locationData.statistics[statisticTypeId].minimum = minimum
    end
    function instance:setStatisticMaximum(statisticTypeId, maximum)
        local locationData = self:getLocationData()
        if locationData.statistics[statisticTypeId] == nil then
            locationData.statistics[statisticTypeId] = {}
        end
        locationData.statistics[statisticTypeId].maximum = maximum
    end
    function instance:setStatistic(statisticTypeId, value)
        local locationData = self:getLocationData()
        if locationData.statistics[statisticTypeId] == nil then
            locationData.statistics[statisticTypeId] = {}
        end
        locationData.statistics[statisticTypeId].value = value
    end
    function instance:setTag(tagType)
        local locationData = self:getLocationData()
        locationData.tags[tagType] = true
    end
    function instance:clearTag(tagType)
        local locationData = self:getLocationData()
        locationData.tags[tagType] = nil
    end
    function instance:getTag(tagType)
        local locationData = self:getLocationData()
        return locationData.tags[tagType] ~= nil
    end
    function instance:hasItems()
        return self:getInventory():hasItems()
    end
    function instance:getItemsOfType(itemTypeId)
        return self:getInventory():getItemsOfType(itemTypeId)
    end
    function instance:removeItem(i)
        self:getInventory():removeItem(i)
    end
    return instance
end
return M