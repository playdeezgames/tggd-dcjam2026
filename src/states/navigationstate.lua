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
local statistictypes = require "business.statistictypes"
local neutral        = require "states.neutral"
local tags           = require "business.tags"
M.LEFT_PREFAB_X = 0
M.LEFT_PREFAB_Y = 0
M.AHEAD_PREFAB_X = 5
M.AHEAD_PREFAB_Y = 0
M.RIGHT_PREFAB_X = 15
M.RIGHT_PREFAB_Y = 0
M.STATS_PANEL_X = 20
M.STATS_PANEL_Y = 0
M.FEATURE_PREFAB_X = 2
M.FEATURE_PREFAB_Y = 2
local function drawRoom()
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be null")
    local cell = avatar:getLocation()
    local ahead = avatar:getFacing()
    local left = cardinalwalker.getLeft(ahead)
    local right = cardinalwalker.getRight(ahead)

    prefabmanager.getPrefab(cell:getRoute(left):getLeftPrefab()):draw(M.LEFT_PREFAB_X,M.LEFT_PREFAB_Y)
    prefabmanager.getPrefab(cell:getRoute(ahead):getAheadPrefab()):draw(M.AHEAD_PREFAB_X,M.AHEAD_PREFAB_Y)
    prefabmanager.getPrefab(cell:getRoute(right):getRightPrefab()):draw(M.RIGHT_PREFAB_X,M.RIGHT_PREFAB_Y)
    if cell:getTag(tags.DEEP_SINK) then
        prefabmanager.getPrefab(prefabs.DEEP_SINK):draw(M.FEATURE_PREFAB_X,M.FEATURE_PREFAB_Y)
    end
end
local function drawStats()
    local x, y = M.STATS_PANEL_X, M.STATS_PANEL_Y
    local w = worldmanager.getWorld()
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    local l = avatar:getLocation()

    framebuffer.writeText(x,y,"Room:"..l:getName(), colors.LIGHT_BLUE, colors.BLACK)
    y = y + 1
    if l:getTag(tags.DEEP_SINK) then
        framebuffer.writeText(x,y,"Deep Sink",colors.DARK_GRAY,colors.BLACK)
        y = y + 1
    end
    local filth = l:getStatistic(statistictypes.FILTH)
    if filth > 0 then
        framebuffer.writeText(x,y,"Room Filth: "..filth,colors.BROWN,colors.BLACK)
        y = y + 1
    end
    framebuffer.writeText(x,y,"Satiety: "..avatar:getStatistic(statistictypes.SATIETY).."/"..avatar:getStatisticMaximum(statistictypes.SATIETY),colors.MAGENTA,colors.BLACK)
    y = y + 1
    local stomach = avatar:getStatistic(statistictypes.STOMACH)
    if stomach > 0 then
        framebuffer.writeText(x,y,"Stomach: "..stomach,colors.LIGHT_MAGENTA,colors.BLACK)
        y = y + 1
    end
    framebuffer.writeText(x,y,"Health: "..avatar:getStatistic(statistictypes.HEALTH).."/"..avatar:getStatisticMaximum(statistictypes.HEALTH),colors.LIGHT_RED,colors.BLACK)
    y = y + 1
    framebuffer.writeText(x,y,"Energy: "..avatar:getStatistic(statistictypes.ENERGY).."/"..avatar:getStatisticMaximum(statistictypes.ENERGY),colors.LIGHT_CYAN,colors.BLACK)
end
local function refresh()
    framebuffer.clear(1, colors.BLACK, colors.BLACK)
    drawRoom()
    drawStats()
end
local function navigationStateStartHandler(state)
    refresh()
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
        avatar:perform(verbs.TURN_LEFT)
        refresh()
        return neutral.nextState(w)
    elseif command == commands.RIGHT then
        avatar:perform(verbs.TURN_RIGHT)
        refresh()
        return neutral.nextState(w)
    elseif command == commands.UP then
        avatar:perform(verbs.MOVE)
        refresh()
        return neutral.nextState(w)
    elseif command == commands.GREEN then
        avatar:setTag(tags.ACTION_MENU)
        return neutral.nextState(w)
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