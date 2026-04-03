local M = {}
local maze = require("utility.maze")
local cardinalwalker = require("utility.cardinalwalker")
local constants = require("constants")
local locationtypes = require("business.locationtypes")
local charactertypes = require("business.charactertypes")
local rng           = require("utility.rng")
local routetypes    = require("business.routetypes")
local tags          = require("business.tags")
local DEEP_SINK_COUNT = 5
local function spawnDeepSinks(map)
    local deepSinkCount = DEEP_SINK_COUNT
    while deepSinkCount > 0 do
        local column = rng.fromRange(1, #map)
        local row = rng.fromRange(1, #map[column])
        local l = map[column][row]
        if not l:getTag(tags.DEEP_SINK) then
            l:setTag(tags.DEEP_SINK)
            deepSinkCount = deepSinkCount - 1
        end
    end
end
local function createLocationMap(w, m)
    local map = {}
    for column = 1, m:getColumns() do
        map[column] = {}
        for row = 1, m:getRows() do
            map[column][row] = w:createLocation(locationtypes.GENERIC, column, row)
        end
    end
    spawnDeepSinks(map)
    --TODO: tag sleep places
    --TODO: spawn rags
    --TODO: spawn food
    return map
end
local function createRoutes(w, map, m, walker)
    for column, mapColumn in ipairs(map) do
        for row, mapCell in ipairs(mapColumn) do
            local mazeCell = m:getCell(column, row)
            for _, direction in ipairs(walker:getDirections()) do
                local door = mazeCell:getDoor(direction)
                local routeType = routetypes.WALL
                local nextColumn, nextRow = walker:step(column, row, direction)
                local nextCell = nil
                if door ~= nil and door:getOpen() then
                    routeType = routetypes.DOOR
                    nextCell = map[nextColumn][nextRow]
                end
                w:createRoute(routeType, direction, mapCell, nextCell)
            end
        end
    end
end
function M.initialize(w)
    w:clear()
    local walker = cardinalwalker.create()
    local m = maze.create(constants.MAZE_COLUMNS, constants.MAZE_ROWS, walker)
    local map = createLocationMap(w, m)
    createRoutes(w, map, m, walker)
    local facing = walker:getDirections()[rng.fromRange(1, #walker:getDirections())]
    local avatar = w:createCharacter(
        charactertypes.N00B, 
        map[rng.fromRange(1, constants.MAZE_COLUMNS)][rng.fromRange(1, constants.MAZE_ROWS)],
        facing)
    w:setAvatar(avatar)
end
return M