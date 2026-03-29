local M = {}
function M.create(performHandler)
    local instance = {}
    instance.performHandler = performHandler
    function instance:perform(character)
        if instance.performHandler ~= nil then
            instance.performHandler(character)
        end
    end
    return instance
end
return M