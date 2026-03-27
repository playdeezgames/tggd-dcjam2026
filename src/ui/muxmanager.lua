local M = {}
local mux = require("ui.mux")
local repository = {}
local function createMux(muxId, filename)
    repository[muxId] = love.audio.newSource(filename, "stream")
end
function M.load()
    createMux(mux.SONG, "assets/audio/mux/we_will_prevail.ogg")
end
return M