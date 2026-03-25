local commands = require("commands")
local M = {}
function M.load()
end
local keyCommands = {}
keyCommands["w"] = commands.UP
keyCommands["z"] = commands.UP
keyCommands["up"] = commands.UP
keyCommands["a"] = commands.LEFT
keyCommands["left"] = commands.LEFt
keyCommands["q"] = commands.LEFT
keyCommands["s"] = commands.DOWN
keyCommands["down"] = commands.DOWN
keyCommands["d"] = commands.RIGHT
keyCommands["right"] = commands.RIGHT
keyCommands["space"] = commands.GREEN
keyCommands["enter"] = commands.BLUE
keyCommands["tab"] = commands.YELLOW
keyCommands["escape"] = commands.RED
keyCommands["backspace"] = commands.RED
local commandQueue = {}
function M.processKey(key)
    local command = keyCommands[key]
    if command ~= nil then
        table.insert(commandQueue, command)
    end
end
function M.nextCommand()
    if #commandQueue > 0 then
        return table.remove(commandQueue,1)
    end
    return nil
end
return M