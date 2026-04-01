local M = {}
function M.create(
        itemName, 
        isAggregate, 
        initializeHandler, 
        itemNameHandler,
        getVerbHandler)
    local instance = {}
    instance.itemName = itemName
    instance.isAggregate = isAggregate
    instance.initializeHandler = initializeHandler
    instance.itemNameHandler = itemNameHandler
    instance.getVerbHandler = getVerbHandler
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
    function instance:getVerbs(c)
        if self.getVerbHandler ~= nil then
            return self.getVerbHandler(c)
        end
        return {}
    end
    return instance
end
return M