local M = {}
function M.create(itemId, text, foreground, background)
    local instance = {}
    instance.itemId = itemId
    instance.text = text
    instance.foreground = foreground
    instance.background = background
    return instance
end
return M