local M = {}
local constants = require("constants")
local framebuffercell = require("framebuffercell")
local colors = require("colors")
local buffer = {}
function M.load()
    for column = 0, constants.CELL_COLUMNS - 1 do
        buffer[column] = {}
        for row = 0, constants.CELL_ROWS - 1 do
            buffer[column][row] = framebuffercell.create(1, colors.BLACK, colors.BLACK)
        end
    end
end
function M.getCell(column, row)
    return buffer[column][row]
end
return M