local M = {}
function M.create(itemName, isAggregate, initializeHandler, itemNameHandler)
    local instance = {}
    instance.itemName = itemName
    instance.isAggregate = isAggregate
    instance.initializeHandler = initializeHandler
    instance.itemNameHandler = itemNameHandler
    function instance:initialize(i)
        if self.initializeHandler ~= nil then
            self.initializeHandler(i)
        end
    end
    function instance:getItemName()
        return self.itemName
    end
    function instance:isAggregate()
        return self.isAggregate
    end
    function instance:getName(i)
        if self.itemNameHandler ~= nil then
            return self.itemNameHandler(i)
        end
        return self:getItemName()
    end
    return instance
end
return M