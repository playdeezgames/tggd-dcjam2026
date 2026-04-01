local itemstack = require "business.itemstack"
local M = {}
function M.create(data, inventoryId, w)
    local instance = {
        data = data,
        inventoryId = inventoryId,
        world = w
    }
    function instance:getWorld()
        return self.world
    end
    function instance:getInventoryId()
        return self.inventoryId
    end
    function instance:getInventoryData()
        return self.data.inventories[self:getInventoryId()]
    end
    function instance:addItem(i)
        self:getInventoryData().items[i:getItemId()] = true
    end
    function instance:removeItem(i)
        self:getInventoryData().items[i:getItemId()] = nil
    end
    function instance:hasItems()
        return next(self:getInventoryData().items) ~= nil
    end
    function instance:getItemStacks()
        local result = {}
        local itemStacks = {}
        for k, _ in pairs(self:getInventoryData().items) do
            local i = self:getWorld():getItem(k)
            local it = i:getItemType()
            if not itemStacks[it] then
                itemStacks[it] = true
                table.insert(result, itemstack.create(self, it, self:getWorld()))
            end
        end
        return result
    end
    function instance:getItemsOfType(itemTypeId)
        local result = {}
        for k, _ in pairs(self:getInventoryData().items) do
            local i = self:getWorld():getItem(k)
            local it = i:getItemType()
            if it == itemTypeId then
                table.insert(result, i)
            end
        end
        return result
    end
    function instance:getItems()
        local result = {}
        for k, _ in pairs(self:getInventoryData().items) do
            table.insert(result, self:getWorld():getItem(k))
        end
        return result
    end
    return instance
end
return M