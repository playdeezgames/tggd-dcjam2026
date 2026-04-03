local state = require "states.state"
local framebuffer = require "ui.framebuffer"
local colors = require "ui.colors"
local commands = require "ui.commands"
local states   = require "states.states"
local worldmanager = require "business.worldmanager"
local M = {}
local function startHandler()
    framebuffer.clear(1, colors.BLACK, colors.BLACK)
    framebuffer.writeText(0,0,"You Win!",colors.LIGHT_GREEN, colors.BLACK)
end
local function stopHandler()
end
local function updateHandler() 
end
local function commandHandler(s, command)
    if command == commands.GREEN then
        worldmanager.getWorld():abandon()
        return states.MAIN_MENU
    end
    return nil
end
function M.create()
    local instance = state.create(
        startHandler, 
        stopHandler, 
        updateHandler, 
        commandHandler)
    return instance
end
return M