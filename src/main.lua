local states = require "states.states"
local framebuffer = require "ui.framebuffer"
local prefabmanager = require "ui.prefabmanager"
local verbmanager   = require "business.verbmanager"
local routetypemanager = require "business.routetypemanager"
local charactertypemanager = require "business.charactertypemanager"
local locationtypemanager  = require "business.locationtypemanager"
local itemtypemanager      = require "business.itemtypemanager"
if arg[#arg] == "debug" then
    require("lldebugger").start()
end
local statemanager = require("states.statemanager")
local commandbuffer = require("ui.commandbuffer")
local imagemanager = require("ui.imagemanager")
local tilesetmanager = require("ui.tilesetmanager")
local tilesets = require("ui.tilesets")
local colormanager = require("ui.colormanager")
local constants = require("constants")
local sfxmanager = require("ui.sfxmanager")
local settingsmanager = require("utility.settingsmanager")
local worldmanager = require("business.worldmanager")
local muxmanager = require("ui.muxmanager")
function love.load()
    love.keyboard.setKeyRepeat(true)
    framebuffer.load()
    colormanager.load()
    commandbuffer.load()
    imagemanager.load()
    tilesetmanager.load()--tileset after images
    sfxmanager.load()
    muxmanager.load()
    settingsmanager.load()
    statemanager.load()
    worldmanager.load()
    prefabmanager.load()
    routetypemanager.load()
    verbmanager.load()
    charactertypemanager.load()
    locationtypemanager.load()
    itemtypemanager.load()
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
--https://alexjgriffith.itch.io/lovejs-player
--7z a -tzip -r ..\sunnymeadows.love *
--https://thegrumpygamedev.itch.io/sunny-meadows-of-splorr