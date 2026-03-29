local M = {}
M.NORTH = "north"
M.EAST = "east"
M.SOUTH = "south"
M.WEST = "west"
local ALL = {M.NORTH, M.EAST, M.SOUTH, M.WEST}
local OPPOSITES = {}
OPPOSITES[M.NORTH] = M.SOUTH
OPPOSITES[M.EAST] = M.WEST
OPPOSITES[M.SOUTH] = M.NORTH
OPPOSITES[M.WEST] = M.EAST
local DELTA_XS = {}
DELTA_XS[M.NORTH] = 0
DELTA_XS[M.EAST] = 1
DELTA_XS[M.SOUTH] = 0
DELTA_XS[M.WEST] = -1
local DELTA_YS = {}
DELTA_YS[M.NORTH] = -1
DELTA_YS[M.EAST] = 0
DELTA_YS[M.SOUTH] = 1
DELTA_YS[M.WEST] = 0
local LEFT_DIRECTIONS = {}
LEFT_DIRECTIONS[M.NORTH] = M.WEST
LEFT_DIRECTIONS[M.EAST] = M.NORTH
LEFT_DIRECTIONS[M.SOUTH] = M.EAST
LEFT_DIRECTIONS[M.WEST] = M.SOUTH
local RIGHT_DIRECTIONS = {}
RIGHT_DIRECTIONS[M.NORTH] = M.EAST
RIGHT_DIRECTIONS[M.EAST] = M.SOUTH
RIGHT_DIRECTIONS[M.SOUTH] = M.WEST
RIGHT_DIRECTIONS[M.WEST] = M.NORTH
function M.create()
    local instance = {}
    function instance:getDirections()
        return ALL
    end
    function instance:step(column, row, direction)
        return column + DELTA_XS[direction], row + DELTA_YS[direction]
    end
    function instance:getOpposite(direction)
        return OPPOSITES[direction]
    end
    return instance
end
function M.getLeft(direction)
    return LEFT_DIRECTIONS[direction]
end
function M.getRight(direction)
    return RIGHT_DIRECTIONS[direction]
end
return M