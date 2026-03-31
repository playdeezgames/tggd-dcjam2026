local itemtypes = require "business.itemtypes"
local fooditemtype = require "business.itemtypes.fooditemtype"
local M = {}
local repository = {}
local function loadItemType(itemTypeId, newItemType)
    repository[itemTypeId] = newItemType
end
function M.load()
    loadItemType(itemtypes.FOOD, fooditemtype.create())
end
function M.getItemType(itemTypeId)
    return repository[itemTypeId]
end
return M