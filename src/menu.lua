local M = {}
local framebuffer = require("framebuffer")
function M.create(column, row, text, foreground, background)
    local instance = {}
    instance.column = column
    instance.row = row
    instance.text = text
    instance.foreground = foreground
    instance.background = background
    instance.items = {}
    instance.currentItem = 1
    function instance:addItem(item)
        table.insert(self.items, item)
    end
    function instance:render()
        local row = self.row
        framebuffer.writeText(self.column, row, self.text, self.foreground, self.background)
        row = row + 1
        for index, item in ipairs(self.items) do
            if index == self.currentItem then
                framebuffer.writeText(self.column, row, item.text, item.background, item.foreground)
            else
                framebuffer.writeText(self.column, row, item.text, item.foreground, item.background)
            end
            row = row + 1
        end
    end
    return instance
end
return M