local M = {}
local states = require("states.states")
local titlestate = require("states.titlestate")
local aboutstate = require("states.aboutstate")
local mainmenustate = require("states.mainmenustate")
local navigationstate = require "states.navigationstate"
local commandbuffer = require("ui.commandbuffer")
local gameoverstate = require("states.gameoverstate")
local actionmenustate = require("states.actionmenustate")
local inventorystate = require("states.inventorystate")
local inventoryitemstackstate = require("states.inventoryitemstackstate")
local inventoryitemstate = require("states.inventoryitemstate")
local groundinventorystate = require("states.groundinventorystate")
local groundinventoryitemstackstate = require("states.groundinventoryitemstackstate")
local groundinventoryitemstate = require("states.groundinventoryitemstate")
local winstate = require("states.winstate")
local repository = {}
local currentStateId = nil
local function loadState(stateId, state)
    repository[stateId] = state
end
function M.load()
    loadState(states.TITLE, titlestate.create())
    loadState(states.MAIN_MENU, mainmenustate.create())
    loadState(states.ABOUT, aboutstate.create())
    loadState(states.NAVIGATION, navigationstate.create())
    loadState(states.GAME_OVER, gameoverstate.create())
    loadState(states.ACTION_MENU, actionmenustate.create())
    loadState(states.INVENTORY, inventorystate.create())
    loadState(states.INVENTORY_ITEM_STACK, inventoryitemstackstate.create())
    loadState(states.INVENTORY_ITEM, inventoryitemstate.create())
    loadState(states.GROUND_INVENTORY, groundinventorystate.create())
    loadState(states.GROUND_INVENTORY_ITEM_STACK, groundinventoryitemstackstate.create())
    loadState(states.GROUND_INVENTORY_ITEM, groundinventoryitemstate.create())
    loadState(states.WIN, winstate.create())
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