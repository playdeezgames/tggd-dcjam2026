local colors = require "colors"
local states = require "states"
if arg[#arg] == "debug" then
    require("lldebugger").start()
end
local statemanager = require("statemanager")
local commandbuffer = require("commandbuffer")
local imagemanager = require("imagemanager")
local tilesetmanager = require("tilesetmanager")
local tilesets = require("tilesets")
local colormanager = require("colormanager")
local colors = require("colors")
function love.load()
    love.keyboard.setKeyRepeat(true)
    statemanager.load()
    commandbuffer.load()
    imagemanager.load()
    tilesetmanager.load()--tileset after images
    colormanager.load()
    --set state as last thing
    statemanager.setState(states.TITLE)
end
function love.update(dt)
    statemanager.update(dt)
end
function love.draw()
    love.graphics.setColor(colormanager.getColor(colors.BLUE):getRGB())--TODO: delete
    tilesetmanager.getTileSet(tilesets.ROM_FONT):getTile(65):draw(0,0)--TODO: delete
end
function love.keypressed( key, scancode, isrepeat )
    commandbuffer.processKey(key)
end