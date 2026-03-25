local M = {}
local state = require("state")
local framebuffer = require("framebuffer")
local constants = require("constants")
local colors = require("colors")
local commands = require("commands")
local function menuStateStartHandler(state)
    framebuffer.fill(0, 0, constants.CELL_COLUMNS, constants.CELL_ROWS, 1, colors.BLACK, colors.BLACK)
    state.menu = state:createMenu()
end
local function menuStateStopHandler(state)
end
local function menuStateUpdateHandler(state, dt)
    state.menu:render()
end
local function menuStateCommandHandler(state, command)
    if command == commands.UP then
        state.menu:previousItem()
    elseif command == commands.DOWN then
        state.menu:nextItem()
    elseif command == commands.GREEN then
        return state:handleMenuItem(state.menu:getCurrentItemId())
    elseif command == commands.RED then
        return state:handleCancel()
    end
    return nil
end
function M.create(createMenuHandler,menuItemHandler, cancelHandler)
    local instance = state.create(
        menuStateStartHandler, 
        menuStateStopHandler, 
        menuStateUpdateHandler, 
        menuStateCommandHandler)
    instance.createMenuHandler = createMenuHandler
    instance.menuItemHandler = menuItemHandler
    instance.cancelHandler = cancelHandler
    function instance:createMenu()
        if self.createMenuHandler ~= nil then
            return self:createMenuHandler()
        end
        return nil
    end
    function instance:handleMenuItem(itemId)
        if self.menuItemHandler ~= nil then
            return self:menuItemHandler(itemId)
        end
        return nil
    end
    function instance:handleCancel()
        if self.cancelHandler ~= nil then
            return self:cancelHandler()
        end
        return nil
    end
    return instance
end
return M