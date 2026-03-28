local M = {}
local state = require "states.state"
local states = require "states.states"
local framebuffer = require "ui.framebuffer"
local colors = require "ui.colors"
local prefabmanager = require "ui.prefabmanager"
local prefabs       = require "ui.prefabs"
M.LEFT_PREFAB_X = 0
M.LEFT_PREFAB_Y = 0
M.AHEAD_PREFAB_X = 5
M.AHEAD_PREFAB_Y = 0
M.RIGHT_PREFAB_X = 15
M.RIGHT_PREFAB_Y = 0
local function navigationStateStartHandler(state)
    framebuffer.clear(1, colors.BLACK, colors.BLACK)
    prefabmanager.getPrefab(prefabs.LEFT_DOOR):draw(M.LEFT_PREFAB_X,M.LEFT_PREFAB_Y)
    prefabmanager.getPrefab(prefabs.AHEAD_DOOR):draw(M.AHEAD_PREFAB_X,M.AHEAD_PREFAB_Y)
    prefabmanager.getPrefab(prefabs.RIGHT_DOOR):draw(M.RIGHT_PREFAB_X,M.RIGHT_PREFAB_Y)
end
local function navigationStateStopHandler(state)
end
local function navigationStateUpdateHandler(state)
end
local function navigationStateCommandHandler(state)
    return nil
end
function M.create()
    local instance = state.create(
        navigationStateStartHandler, 
        navigationStateStopHandler, 
        navigationStateUpdateHandler, 
        navigationStateCommandHandler)
    return instance
end
return M