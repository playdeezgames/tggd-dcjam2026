local M = {}
local states = require("states")
local titlestate = require("titlestate")
local commandbuffer = require("commandbuffer")
local repository = {}
local currentStateId = nil
local function loadState(stateId, state)
    repository[stateId] = state
end
function M.load()
    loadState(states.TITLE, titlestate.create())
end
local function handleCommand(command)
    if currentStateId ~= nil then
        repository[currentStateId]:handleCommand(command)
    end
end
local function updateCurrentState(dt)
    if currentStateId ~= nil then
        repository[currentStateId]:update(dt)
    end
end
function M.update(dt)
    local command = nil
    repeat
        command = commandbuffer.nextCommand()
        if command ~= nil then
            handleCommand(command)
        end
    until command == nil
    updateCurrentState(dt)
end
local function startCurrentState()
    if currentStateId ~= nil then
        repository[currentStateId]:start()
    end
end
local function stopCurrentState()
    if currentStateId ~= nil then
        repository[currentStateId]:stop()
    end
end
function M.setState(stateId)
    if currentStateId ~= stateId then
        stopCurrentState()
        currentStateId = stateId
        startCurrentState()
    end
end
function M.getState()
    return currentStateId
end
return M