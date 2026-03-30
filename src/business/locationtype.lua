local M = {}
function M.create(initializeHandler)
    local instance = {}
    instance.initializeHandler = initializeHandler
    function instance:initialize(l)
        if self.initializeHandler ~= nil then
            self.initializeHandler(l)
        end
    end
    return instance
end
return M