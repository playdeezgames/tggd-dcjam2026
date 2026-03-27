local M = {}
M.INSIDE = "inside"
M.OUTSIDE = "outside"
M.FRONTIER = "frontier"
function M.create()
    local instance = {}
    instance.state = M.OUTSIDE
    instance.neighbors = {}
    instance.doors = {}
    function instance:setState(state)
        self.state = state
    end
    function instance:getState()
        return self.state
    end
    function instance:setNeighbor(direction, neighbor)
        self.neighbors[direction] = neighbor
    end
    function instance:getNeighbor(direction)
        return self.neighbors[direction]
    end
    function instance:setDoor(direction, door)
        self.doors[direction] = door
    end
    function instance:getDoor(direction)
        return self.doors[direction]
    end
    return instance
end
return M