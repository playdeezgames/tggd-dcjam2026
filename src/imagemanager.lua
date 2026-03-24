local M = {}
local images = require("images")
local repository = {}
local function loadImage(imageId,filename)
    repository[imageId]=love.graphics.newImage(filename)
end
function M.load()
    loadImage(images.ROM_FONT, "assets/images/romfont8x8.png")
end
function M.getImage(imageId)
    return repository[imageId]
end
return M