local M = {}
local state = require("states.state")
local framebuffer = require("ui.framebuffer")
local constants = require("constants")
local colors = require("ui.colors")
local commands = require("ui.commands")
local states   = require("states.states")
local function aboutStateStartHandler(state)
    framebuffer.clear(1, colors.BLACK, colors.BLACK)
    framebuffer.writeText(0,0,"About Sunny Meadows of SPLORR!!",colors.BROWN, colors.BLACK)
    local row = 1
    framebuffer.writeText(0,row,"Everybody knows that there is a six",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 1
    framebuffer.writeText(0,row,"million year old frog-like creature in",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 1
    framebuffer.writeText(0,row,"his own universe named Zex the Guh who",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 1
    framebuffer.writeText(0,row,"who can only speak through Ouija boards",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 1
    framebuffer.writeText(0,row,"and Large Language Models.",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 2
    framebuffer.writeText(0,row,"This game has nothing to do with that.",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 2
    framebuffer.writeText(0,row,"Yer a janitor working in a retirement",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 1
    framebuffer.writeText(0,row,"home cleaning up the biowaste of long",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 1
    framebuffer.writeText(0,row,"retired heroes.",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 2
    framebuffer.writeText(0,row,"Good luck.",colors.LIGHT_GRAY, colors.BLACK)
    row = row + 2
    framebuffer.writeText(0,row,"For more information on Zex the Guh,",colors.CYAN, colors.BLACK)
    row = row + 1
    framebuffer.writeText(0,row,"visit patreon.com/zextheguh",colors.CYAN, colors.BLACK)
end
local function aboutStateStopHandler(state)
end
local function aboutStateUpdateHandler(state, dt)
end
local function aboutStateCommandHandler(state, command)
    if command == commands.GREEN then
        return states.MAIN_MENU
    end
    return nil
end
function M.create()
    local instance = state.create(
        aboutStateStartHandler, 
        aboutStateStopHandler, 
        aboutStateUpdateHandler, 
        aboutStateCommandHandler)
    return instance
end
return M