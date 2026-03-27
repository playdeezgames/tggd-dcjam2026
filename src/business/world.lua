local M = {}
function M.create(data)
    local instance = {}
    instance.data = data
    function instance:initialize()
        --TODO: initialize
    end
    return instance
end
return M