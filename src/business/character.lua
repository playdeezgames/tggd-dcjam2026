local M = {}
function M.create(data, characterId)
    local instance = {
        data = data,
        characterId = characterId
    }
    function instance:getCharacterId()
        return self.characterId
    end
    function instance:getCharacterData()
        return self.data[self:getCharacterId()]
    end
    return instance
end
return M