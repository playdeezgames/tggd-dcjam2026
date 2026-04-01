local M = {}
local itemtypemanager = require "business.itemtypemanager"
function M.create(inv, it, w)
    local instance = {
        inventory = inv,
        itemType = it,
        world = w
    }
    function instance:getItemType()
        return self.itemType
    end
    function instance:getItemName()
        return itemtypemanager.getItemType(self:getItemType()):getItemName()
    end
    function instance:getItemCount()
        local result = 0
        for _, v in ipairs(self.inventory:getItems()) do
            if v:getItemType() == self:getItemType() then
                result = result + 1
            end
        end
        return result
    end
    return instance
end
return M