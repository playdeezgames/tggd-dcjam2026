local M = {}
function M.create(initializeHandler)
    local instance = {}
    instance.initializeHandler = initializeHandler
    function instance:initialize(i)
        if self.initializeHandler ~= nil then
            self.initializeHandler(i)
        end
    end
    return instance
end
return M