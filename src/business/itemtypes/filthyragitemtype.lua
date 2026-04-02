local itemtype = require "business.itemtype"
local verbs    = require "business.verbs"
local M = {}
M.ITEM_NAME = "Filthy Rag"
M.IS_AGGREGATE = true
M.VERBS = {
    verbs.RINSE
}
local function initializeHandler(i)
end
local function itemNameHandler(i)
    return M.ITEM_NAME.."(#"..i:getItemId()..")"
end
local function getVerbHandler(c)
    local result = {}
    for _, v in ipairs(M.VERBS) do
        if c:canSelect(v) then
            table.insert(result, v)
        end
    end
    return result
end
function M.create()
    local instance = itemtype.create(
        M.ITEM_NAME,
        M.IS_AGGREGATE,
        initializeHandler,
        itemNameHandler,
        getVerbHandler)
    instance.canRinse = true
    return instance
end
return M