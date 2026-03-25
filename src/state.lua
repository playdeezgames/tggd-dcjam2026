local M = {}
function M.create(startHandler, stopHandler, updateHandler, commandHandler)
    local instance = {}
    instance.startHandler = startHandler
    instance.stopHandler = stopHandler
    instance.updateHandler = updateHandler
    instance.commandHandler = commandHandler
    function instance:start()
        if self.startHandler ~= nil then
            self:startHandler()
        end
    end
    function instance:stop()
        if self.stopHandler ~= nil then
            self:stopHandler()
        end
    end
    function instance:update(dt)
        if self.updateHandler ~= nil then
            self:updateHandler(dt)
        end
    end
    function instance:handleCommand(command)
        if self.commandHandler ~= nil then
            self:commandHandler(command)
        end
    end
    return instance
end
return M