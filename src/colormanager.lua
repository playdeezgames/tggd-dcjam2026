local M = {}
local colors = require("colors")
local color = require("color")
local repository = {}
local function loadColor(colorId, red, green, blue)
    repository[colorId] = color.create(red,green,blue)
end
function M.load()
    loadColor(colors.BLACK,0,0,0)
    loadColor(colors.BLUE,0,0,2/3)
    loadColor(colors.GREEN,0,2/3,0)
    loadColor(colors.CYAN,0,2/3,2/3)
    loadColor(colors.RED,2/3,0,0)
    loadColor(colors.MAGENTA,2/3,0,2/3)
    loadColor(colors.BROWN,2/3,1/3,0)
    loadColor(colors.LIGHT_GRAY,2/3,2/3,2/3)
    loadColor(colors.DARK_GRAY,1/3,1/3,1/3)
    loadColor(colors.LIGHT_BLUE,1/3,1/3,1)
    loadColor(colors.LIGHT_GREEN,1/3,1,1/3)
    loadColor(colors.LIGHT_CYAN,1/3,1,1)
    loadColor(colors.LIGHT_RED,1,1/3,1/3)
    loadColor(colors.LIGHT_MAGENTA,1,1/3,1)
    loadColor(colors.YELLOW,1,1,1/3)
    loadColor(colors.WHITE,1,1,1)
end
function M.getColor(colorId)
    return repository[colorId]
end
return M