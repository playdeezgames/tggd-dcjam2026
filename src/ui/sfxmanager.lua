local M = {}
local sfx = require("ui.sfx")
local repository = {}
local function loadSfx(sfxId,filename)
    repository[sfxId] = love.audio.newSource(filename,"static")
end
function M.load()
    loadSfx(sfx.TEST, "assets/audio/sfx/test.wav")
end
function M.play(sfxId)
    repository[sfxId]:stop()
    repository[sfxId]:play()
end
return M