local M = {}
local worlddata = require("data.worlddata")
local world = require("business.world")
local repository = nil
function M.load()
    repository = worlddata.create()
end
function M.getWorld()
    return world.create(repository)
end
return M