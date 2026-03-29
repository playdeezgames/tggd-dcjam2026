local M = {}
function M.create(initializeHandler)
    local instance = {}
    instance.initializeHandler = initializeHandler
    function instance:initialize(c)
        if instance.initializeHandler ~= nil then
            instance.initializeHandler(c)
        end
    end
    return instance
end
return M