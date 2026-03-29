local M = {}
local state = require "states.state"
local states = require "states.states"
local framebuffer = require "ui.framebuffer"
local colors = require "ui.colors"
local prefabmanager = require "ui.prefabmanager"
local prefabs       = require "ui.prefabs"
local worldmanager = require "business.worldmanager"
local cardinalwalker = require "utility.cardinalwalker"
local routetypes     = require "business.routetypes"
local commands       = require "ui.commands"
local verbs          = require "business.verbs"
M.LEFT_PREFAB_X = 0
M.LEFT_PREFAB_Y = 0
M.AHEAD_PREFAB_X = 5
M.AHEAD_PREFAB_Y = 0
M.RIGHT_PREFAB_X = 15
M.RIGHT_PREFAB_Y = 0
local function drawRoom()
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be null")
    local cell = avatar:getLocation()
    local ahead = avatar:getFacing()
    local left = cardinalwalker.getLeft(ahead)
    local right = cardinalwalker.getRight(ahead)

    local route = cell:getRoute(left)
    local prefab = prefabs.LEFT_WALL
    if route:getRouteType() == routetypes.DOOR then
        prefab = prefabs.LEFT_DOOR
    end
    prefabmanager.getPrefab(prefab):draw(M.LEFT_PREFAB_X,M.LEFT_PREFAB_Y)
    
    route = cell:getRoute(ahead)
    prefab = prefabs.AHEAD_WALL
    if route:getRouteType() == routetypes.DOOR then
        prefab = prefabs.AHEAD_DOOR
    end
    prefabmanager.getPrefab(prefab):draw(M.AHEAD_PREFAB_X,M.AHEAD_PREFAB_Y)

    route = cell:getRoute(right)
    prefab = prefabs.RIGHT_WALL
    if route:getRouteType() == routetypes.DOOR then
        prefab = prefabs.RIGHT_DOOR
    end
    prefabmanager.getPrefab(prefab):draw(M.RIGHT_PREFAB_X,M.RIGHT_PREFAB_Y)
end
local function navigationStateStartHandler(state)
    framebuffer.clear(1, colors.BLACK, colors.BLACK)
    drawRoom()
end
local function navigationStateStopHandler(state)
end
local function navigationStateUpdateHandler(state)
end
local function navigationStateCommandHandler(state, command)
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should exist")
    if command == commands.LEFT then
        avatar:doVerb(verbs.TURN_LEFT)
        drawRoom()
    elseif command == commands.RIGHT then
        avatar:doVerb(verbs.TURN_RIGHT)
        drawRoom()
    elseif command == commands.UP then
        avatar:doVerb(verbs.MOVE)
        drawRoom()
    end
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