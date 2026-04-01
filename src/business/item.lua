local itemtypemanager = require "business.itemtypemanager"
local M = {}
function M.create(data, itemId, w)
    local instance = {
        data = data,
        itemId = itemId,
        world = w
    }
    function instance:getItemId()
        return self.itemId
    end
    function instance:getItemData()
        return self.data.items[self:getItemId()]
    end
    function instance:getItemType()
        return self:getItemData().itemType
    end
    function instance:initialize()
        itemtypemanager.getItemType(self:getItemType()):initialize(self)
    end
    function instance:getName()
        return itemtypemanager.getItemType(self:getItemType()):getName(self)
    end
    function instance:getVerbs(c)
        return itemtypemanager.getItemType(self:getItemType()):getVerbs(c)
    end
    function instance:recycle()
        self.data.items[self:getItemId()] = {}
        table.insert(self.data.recycled_items, self:getItemId())
    end
    return instance
end
return M