local itemtype = require "business.itemtype"
local M = {}
M.ITEM_NAME = "Food"
M.IS_AGGREGATE = true
local function initializeHandler(i)
end
local function itemNameHandler(i)
    return M.ITEM_NAME.."(#"..i:getItemId()..")"
end
function M.create()
    local instance = itemtype.create(
        M.ITEM_NAME,
        M.IS_AGGREGATE,
        initializeHandler,
        itemNameHandler)
    return instance
end
return M