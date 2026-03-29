local charactertypes = require "business.charactertypes"
local n00bcharactertype = require "business.charactertypes.n00bcharactertype"
local M = {}
local repository = {}
local function loadCharacterType(characterTypeId, newCharacterType)
    repository[characterTypeId] = newCharacterType
end
function M.load()
    loadCharacterType(charactertypes.N00B, n00bcharactertype.create())
end
function M.getCharacterType(characterTypeId)
    return repository[characterTypeId]
end
return M