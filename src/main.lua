if arg[#arg] == "debug" then
    require("lldebugger").start()
end
local statemanager = require("statemanager")
local commandbuffer = require("commandbuffer")
local imagemanager = require("imagemanager")
local images = require("images")
function love.load()
    love.keyboard.setKeyRepeat(true)
    statemanager.load()
    commandbuffer.load()
    imagemanager.load()
end
function love.update(dt)
    statemanager.update(dt)
end
function love.draw()
    statemanager.draw()
end
function love.keypressed( key, scancode, isrepeat )
    commandbuffer.processKey(key)
end