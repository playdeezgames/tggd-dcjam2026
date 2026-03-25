local M = {}
local tilesets = require("tilesets")
local images = require("images")
local imagemanager = require("imagemanager")
local tileset = require("tileset")
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