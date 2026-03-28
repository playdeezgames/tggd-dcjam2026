local M = {}
local framebuffer = require "ui.framebuffer"
function M.create(texts, foreground, background)
    local instance = {}
    instance.texts = texts
    instance.foreground = foreground
    instance.background = background
    function instance:draw(column, row)
        for _, text in ipairs(self.texts) do
            framebuffer.writeText(column, row, text, self.foreground, self.background)
            row = row + 1
        end
    end
    return instance
end
return M