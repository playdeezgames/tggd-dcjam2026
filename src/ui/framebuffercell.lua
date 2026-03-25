local M = {}
function M.create(tileId, foreground, background)
    local instance = {}
    instance.tileId = tileId
    instance.foreground = foreground
    instance.background = background
    return instance
end
return M