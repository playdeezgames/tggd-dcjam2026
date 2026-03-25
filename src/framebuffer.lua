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
function M.fill(column, row, columns, rows, tileId, foreground, background)
    for c = 0, columns - 1 do
        for r = 0, rows - 1 do
            local cell = buffer[c+column][r+row]
            if cell ~= nil then
                cell.tileId = tileId
                cell.foreground = foreground
                cell.background = background
            end
        end
    end
end
function M.writeText(column, row, text, foreground, background)
    for index = 1, #text do
        local cell = M.getCell(column, row)
        if cell ~= nil then
            cell.tileId = text:byte(index) + 1
            cell.foreground = foreground
            cell.background = background
        end
        column = column + 1
    end
end
return M
--framebuffer.writeText(0,  0, [[\                  /]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  1, [[ \                / ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  2, [[  \              /  ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  3, [[   \            /   ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  4, [[    \          /    ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  5, [[     +--------+     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  6, [[     |        |     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  7, [[     |        |     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  8, [[     |        |     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  9, [[     |        |     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 10, [[     |        |     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 11, [[     |        |     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 12, [[     |        |     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 13, [[     |        |     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 14, [[     +--------+     ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 15, [[    /          \    ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 16, [[   /            \   ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 17, [[  /              \  ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 18, [[ /                \ ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 19, [[/                  \]], colors.BLUE, colors.LIGHT_BLUE)

--framebuffer.writeText(0,  0, [[\                  /]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  1, [[ \                / ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  2, [[  \              /  ]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  3, [[+  \            /  +]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  4, [[|\  \          /  /|]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  5, [[| +  +--------+  + |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  6, [[| |  |        |  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  7, [[| |  |        |  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  8, [[| |  |  +--+  |  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0,  9, [[| |  |  |  |  |  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 10, [[| |  |  |  |  |  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 11, [[| |  |  |  |  |  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 12, [[| |  |  |  |  |  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 13, [[| |  |  |  |  |  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 14, [[| |  +--+  +--+  | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 15, [[| | /          \ | |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 16, [[| |/            \| |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 17, [[| +              + |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 18, [[|                  |]], colors.BLUE, colors.LIGHT_BLUE)
--framebuffer.writeText(0, 19, [[+                  +]], colors.BLUE, colors.LIGHT_BLUE)
