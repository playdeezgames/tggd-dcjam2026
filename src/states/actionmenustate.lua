local M = {}
local commands = require "ui.commands"
local framebuffer = require "ui.framebuffer"
local colors = require "ui.colors"
local neutral = require "states.neutral"
local worldmanager = require "business.worldmanager"
local state = require "states.state"
local tags  = require "business.tags"
local function updateHandler(state, dt)
end
local function commandHandler(state, command)
    local w = worldmanager.getWorld()
    if command == commands.GREEN then
        w:getAvatar():clearTag(tags.ACTION_MENU)
        return neutral.nextState(w)
    end
    return nil
end
local function startHandler(state)
    framebuffer.clear(1, colors.BLACK, colors.BLACK)
    framebuffer.writeText(0,0,"Action Menu", colors.BROWN, colors.BLACK)
end
local function stopHandler(state)
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