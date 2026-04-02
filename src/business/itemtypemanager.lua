local itemtypes = require "business.itemtypes"
local fooditemtype = require "business.itemtypes.fooditemtype"
local ragitemtype = require "business.itemtypes.ragitemtype"
local filthyragitemtype = require "business.itemtypes.filthyragitemtype"
local M = {}
local repository = {}
local function loadItemType(itemTypeId, newItemType)
    repository[itemTypeId] = newItemType
end
function M.load()
    loadItemType(itemtypes.FOOD, fooditemtype.create())
    loadItemType(itemtypes.RAG, ragitemtype.create())
    loadItemType(itemtypes.FILTHY_RAG, filthyragitemtype.create())
end
function M.getItemType(itemTypeId)
    return repository[itemTypeId]
end
return M