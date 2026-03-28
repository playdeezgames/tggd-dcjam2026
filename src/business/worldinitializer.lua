local M = {}
local maze = require("utility.maze")
local cardinalwalker = require("utility.cardinalwalker")
local constants = require("constants")
local locationtypes = require("business.locationtypes")
local charactertypes = require("business.charactertypes")
local rng           = require("utility.rng")
function M.initialize(world)
    world:clear()
    local walker = cardinalwalker.create()
    local m = maze.create(constants.MAZE_COLUMNS, constants.MAZE_ROWS, walker)
    local map = {}
    for column = 1, m:getColumns() do
        map[column] = {}
        for row = 1, m:getRows() do
            map[column][row] = world:createLocation(locationtypes.GENERIC, column, row)
        end
    end
    local facing = walker:getDirections()[rng.fromRange(1, #walker:getDirections())]
    local avatar = world:createCharacter(
        charactertypes.N00B, 
        map[rng.fromRange(1, constants.MAZE_COLUMNS)][rng.fromRange(1, constants.MAZE_ROWS)],
        facing)
    world:setAvatar(avatar)
end
return M