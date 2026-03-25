local M = {}
local tile = require("tile")
function M.create(image, tileWidth, tileHeight)
    local instance = {}
    instance.tiles = {}
    local tileColumns = math.floor(image:getWidth() / tileWidth)
    local tileRows = math.floor(image:getHeight() / tileHeight)
    for row = 0, tileRows - 1 do
        for column = 0, tileColumns - 1 do
            table.insert(
                instance.tiles, 
                tile.create(
                    image, 
                    column * tileWidth, 
                    row * tileHeight, 
                    tileWidth, tileHeight))
        end
    end
    function instance:getTile(tileId)
        return self.tiles[tileId]
    end
    return instance
end
return M