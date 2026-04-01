local itemtype = require "business.itemtype"
local verbs    = require "business.verbs"
local M = {}
M.ITEM_NAME = "Food"
M.IS_AGGREGATE = true
M.VERBS = {
    verbs.EAT
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
    instance.edible = true
    instance.stomach = 50
    return instance
end
return M