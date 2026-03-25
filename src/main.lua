local states = require "states"
local framebuffer = require "framebuffer"
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
local constants = require("constants")
function love.load()
    love.keyboard.setKeyRepeat(true)
    statemanager.load()
    commandbuffer.load()
    imagemanager.load()
    tilesetmanager.load()--tileset after images
    colormanager.load()
    framebuffer.load()
--TODO: snip
    local cell = framebuffer.getCell(0,0)
    if cell ~= nil then
        cell.tileId = 65
        cell.foreground = colors.BLUE
        cell.background = colors.LIGHT_BLUE
    end
--TODO: end snip
    --set state as last thing
    statemanager.setState(states.TITLE)
end
function love.update(dt)
    statemanager.update(dt)
end
function love.draw()
    local tileset = tilesetmanager.getTileSet(tilesets.ROM_FONT)
    for column = 0, constants.CELL_COLUMNS - 1 do
        for row = 0, constants.CELL_ROWS - 1 do
            local x = column * constants.CELL_WIDTH
            local y = row * constants.CELL_HEIGHT
            local cell = framebuffer.getCell(column, row)
            if cell ~= nil then
                love.graphics.setColor(colormanager.getColor(cell.background):getRGB())
                tileset:getTile(220):draw(x,y)
                love.graphics.setColor(colormanager.getColor(cell.foreground):getRGB())
                tileset:getTile(cell.tileId):draw(x,y)
            end
        end
    end
end
function love.keypressed( key, scancode, isrepeat )
    commandbuffer.processKey(key)
end