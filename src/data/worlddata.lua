local M = {}
function M.create()
    local instance = {}
    instance.locations = {}
    instance.characters = {}
    instance.avatarId = nil
    return instance
end
return M