local M = {}
M.FILENAME = "settings.json"
M.SFX_VOLUME_DEFAULT = 0.5
local settings = require("utility.settings")
local json = require("utility.json")
local repository = {}
function M.load()
    local content = love.filesystem.read(M.FILENAME)
    if content ~= nil then
        repository = json.decode(content)
    else
        repository[settings.SFX_VOLUME] = M.SFX_VOLUME_DEFAULT
    end
    print(repository[settings.SFX_VOLUME])
end
function M.getSetting(settingId)
    return repository[settingId]
end
function M.setSetting(settingId, value)
    repository[settingId] = value
end
function M.save()
    love.filesystem.write(M.FILENAME,json.encode(repository))
end
return M