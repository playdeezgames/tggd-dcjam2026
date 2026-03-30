local M = {}
local locationtypes = require "business.locationtypes"
local genericlocationtype = require "business.locationtypes.genericlocationtype"
local repository = {}
local function loadLocationType(locationTypeId, newLocationType)
    repository[locationTypeId] = newLocationType
end
function M.load()
    loadLocationType(locationtypes.GENERIC, genericlocationtype.create())
end
function M.getLocationType(locationTypeId)
    return repository[locationTypeId]
end
return M