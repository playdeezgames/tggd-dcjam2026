local M = {}
function M.create(leftPrefab, aheadPrefab, rightPrefab, isPassableHandler)
    local instance = {}
    instance.leftPrefab = leftPrefab
    instance.rightPrefab = rightPrefab
    instance.aheadPrefab = aheadPrefab
    instance.isPassableHandler = isPassableHandler
    function instance:isPassable(r,c)
        if instance.isPassableHandler ~= nil then
            return instance.isPassableHandler(r, c)
        end
        return false
    end
    function instance:getLeftPrefab()
        return self.leftPrefab
    end
    function instance:getRightPrefab()
        return self.rightPrefab
    end
    function instance:getAheadPrefab()
        return self.aheadPrefab
    end
    return instance
end
return M