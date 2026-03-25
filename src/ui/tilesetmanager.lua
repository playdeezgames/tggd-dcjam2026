local M = {}
local tilesets = require("ui.tilesets")
local images = require("ui.images")
local imagemanager = require("ui.imagemanager")
local tileset = require("ui.tileset")
local constants = require("constants")
local repository = {}
local function loadTileSet(tileSetId,imageId,tileWidth,tileHeight)
    local image = imagemanager.getImage(imageId)
    repository[tileSetId] = tileset.create(image, tileWidth, tileHeight)
end
function M.load()
    loadTileSet(
        tilesets.ROM_FONT, 
        images.ROM_FONT, 
        constants.CELL_WIDTH, 
        constants.CELL_HEIGHT)
end
function M.getTileSet(tileSetId)
    return repository[tileSetId]
end
return M