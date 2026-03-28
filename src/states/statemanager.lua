local M = {}
local states = require("states.states")
local titlestate = require("states.titlestate")
local aboutstate = require("states.aboutstate")
local mainmenustate = require("states.mainmenustate")
local commandbuffer = require("ui.commandbuffer")
local repository = {}
local currentStateId = nil
local function loadState(stateId, state)
    repository[stateId] = state
end
function M.load()
    loadState(states.TITLE, titlestate.create())
    loadState(states.MAIN_MENU, mainmenustate.create())
    loadState(states.ABOUT, aboutstate.create())
end
local function handleCommand(command)
    if currentStateId ~= nil then
        return repository[currentStateId]:handleCommand(command)
    end
    return nil
end
local function updateCurrentState(dt)
    if currentStateId ~= nil then
        repository[currentStateId]:update(dt)
    end
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
local function setCurrentStateId(stateId)
    if currentStateId ~= stateId then
        stopCurrentState()
        currentStateId = stateId
        startCurrentState()
    end
end
function M.update(dt)
    local command = nil
    repeat
        command = commandbuffer.nextCommand()
        if command ~= nil then
            local nextState = handleCommand(command)
            if nextState ~= nil then
                setCurrentStateId(nextState)
            end
        end
    until command == nil
    updateCurrentState(dt)
end
function M.setState(stateId)
    setCurrentStateId(stateId)
end
function M.getState()
    return currentStateId
end
return M