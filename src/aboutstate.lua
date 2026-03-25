local M = {}
local menustate = require("menustate")
function M.create()
    local instance = menustate.create()
    return instance
end
return M