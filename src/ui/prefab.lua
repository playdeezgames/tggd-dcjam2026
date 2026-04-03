local M = {}
local framebuffer = require "ui.framebuffer"
function M.create(texts, foreground, background, transparent)
    local instance = {}
    instance.texts = texts
    instance.foreground = foreground
    instance.background = background
    instance.transparent = transparent
    function instance:draw(column, row)
        for _, text in ipairs(self.texts) do
            framebuffer.writeText(column, row, text, self.foreground, self.background, instance.transparent)
            row = row + 1
        end
    end
    return instance
end
return M