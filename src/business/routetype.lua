local M = {}
function M.create(isPassableHandler)
    local instance = {}
    instance.isPassableHandler = isPassableHandler
    function instance:isPassable(r,c)
        if instance.isPassableHandler ~= nil then
            return instance.isPassableHandler(r, c)
        end
        return false
    end
    return instance
end
return M