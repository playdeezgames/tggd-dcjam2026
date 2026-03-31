local M = {}
function M.create(text, performHandler,canSelectHandler)
    local instance = {}
    instance.text = text
    instance.performHandler = performHandler
    instance.canSelectHandler = canSelectHandler
    function instance:getText()
        return text
    end
    function instance:perform(c)
        if instance.performHandler ~= nil then
            instance.performHandler(c)
        end
    end
    function instance:canSelect(c)
        if instance.canSelectHandler ~= nil then
            return instance.canSelectHandler(c)
        end
        return false
    end
    return instance
end
return M