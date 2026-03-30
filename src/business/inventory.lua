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
    return instance
end
return M