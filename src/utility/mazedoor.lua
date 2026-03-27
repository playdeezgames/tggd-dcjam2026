local M = {}
function M.create()
    local instance = {}
    instance.open = false
    function instance:setOpen(open)
        self.open = open
    end
    function instance:getOpen()
        return self.open
    end
    return instance
end
return M