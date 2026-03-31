local M = {}
function M.create(data, inventoryId, w)
    local instance = {
        data = data,
        inventoryId = inventoryId,
        world = w
    }
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
    return instance
end
return M