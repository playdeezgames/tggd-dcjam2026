local M = {}
local sfx = require("ui.sfx")
local settingsmanager = require("utility.settingsmanager")
local settings        = require("utility.settings")
local repository = {}
local function loadSfx(sfxId,filename)
    repository[sfxId] = love.audio.newSource(filename,"static")
end
function M.load()
    loadSfx(sfx.TEST, "assets/audio/sfx/test.wav")
end
function M.play(sfxId)
    repository[sfxId]:stop()
    repository[sfxId]:setVolume(settingsmanager.getSetting(settings.SFX_VOLUME))
    repository[sfxId]:play()
end
return M