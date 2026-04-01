local M = {}
local states = require("states.states")
local statistictypes = require("business.statistictypes")
local tags           = require("business.tags")
local metadatas      = require("business.metadatas")
local yokes          = require("business.yokes")
function M.nextState(w)
    local avatar = w:getAvatar()
    assert(avatar, "avatar should not be nil")
    local health = avatar:getStatistic(statistictypes.HEALTH)
    local minimumHealth = avatar:getStatisticMinimum(statistictypes.HEALTH)
    if health <= minimumHealth then
        return states.GAME_OVER
    end
    if avatar:getTag(tags.ACTION_MENU) then
        return states.ACTION_MENU
    elseif avatar:getTag(tags.INVENTORY) then
        local itemStackType = avatar:getMetadata(metadatas.ITEM_STACK_TYPE)
        if itemStackType ~= nil then
            local yokedItemId = avatar:getYoke(yokes.ITEM_ID)
            if yokedItemId ~= nil then
                return states.INVENTORY_ITEM
            else
                return states.INVENTORY_ITEM_STACK
            end
        else
            return states.INVENTORY
        end
    end
    return states.NAVIGATION
end
return M