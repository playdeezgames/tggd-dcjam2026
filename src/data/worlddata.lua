local M = {}
function M.create()
    local instance = {}
    instance.locations = {}
    instance.characters = {}
    instance.routes = {}
    instance.avatarId = nil
    instance.inventories = {}
    instance.items = {}
    return instance
end
return M