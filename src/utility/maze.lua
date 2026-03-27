local M = {}
local mazecell = require("utility.mazecell")
local mazedoor = require("utility.mazedoor")
local rng = require("utility.rng")
function M.create(columns, rows, walker)
    local instance = {}
    instance.columns = columns
    instance.rows = rows
    function instance:getColumns()
        return self.columns
    end
    function instance:getRows()
        return self.rows
    end
    instance.cells = {}
    while #instance.cells < columns do
        local cellColumn = {}
        table.insert(instance.cells, cellColumn)
        while #cellColumn < rows do
            table.insert(cellColumn, mazecell.create())
        end
    end
    function instance:getCell(column, row)
        if column < 1 or row < 1 or columns > self:getColumns() or row > self:getRows() then
            return nil
        end
        return self.cells[column][row]
    end
    for column = 1, columns do
        for row = 1, rows do
            local cell = instance:getCell(column, row)
            assert(cell, "maze cell "..column..", "..row.." should exist!")
            for _, direction in ipairs(walker:getDirections()) do
                local nextColumn, nextRow = walker:step(column, row, direction)
                if cell:getNeighbor(direction) == nil and
                    nextColumn >= 1 and
                    nextRow >= 1 and 
                    nextColumn <= instance:getColumns() and
                    nextRow <= instance:getRows() then
                    local nextCell = instance:getCell(nextColumn, nextRow)
                    assert(nextCell, "i have checked, and the next cell should exist")
                    local door = mazedoor.create()
                    cell:setNeighbor(direction, nextCell)
                    cell:setDoor(direction, door)
                    local opposite = walker:getOpposite(direction)
                    nextCell:setNeighbor(opposite, cell)
                    nextCell:setDoor(opposite, door)
                end
            end
        end
    end
    local cell = instance:getCell(rng.fromRange(1,columns),rng.fromRange(1,rows))
    assert(cell,"generating maze, cell should exist")
    cell:setState(mazecell.INSIDE)
    local frontier = {}
    for _, direction in ipairs(walker:getDirections()) do
        local nextCell = cell:getNeighbor(direction)
        if nextCell ~= nil and nextCell:getState() == mazecell.OUTSIDE then
            table.insert(frontier, nextCell)
            nextCell:setState(mazecell.FRONTIER)
        end
    end
    while #frontier > 0 do
        cell = table.remove(frontier, rng.fromRange(1, #frontier))
        local candidates = {}
        for _, direction in ipairs(walker:getDirections()) do
            local nextCell = cell:getNeighbor(direction)
            if nextCell ~= nil and nextCell:getState() == mazecell.INSIDE then
                table.insert(candidates, direction)
            end
        end
        local chosen = candidates[rng.fromRange(1, #candidates)]
        cell:getDoor(chosen):setOpen(true)
        cell:setState(mazecell.INSIDE)
        for _, direction in ipairs(walker:getDirections()) do
            local nextCell = cell:getNeighbor(direction)
            if nextCell ~= nil and nextCell:getState() == mazecell.OUTSIDE then
                table.insert(frontier, nextCell)
                nextCell:setState(mazecell.FRONTIER)
            end
        end
    end
    return instance
end
return M