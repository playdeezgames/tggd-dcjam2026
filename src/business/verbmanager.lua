local verbs = require "business.verbs"
local turnleftverb = require "business.verbs.turnleftverb"
local turnrightverb= require "business.verbs.turnrightverb"
local M = {}
local repository = {}
local function loadVerb(verbId, newVerb)
    repository[verbId] = newVerb
end
function M.load()
    loadVerb(verbs.TURN_LEFT, turnleftverb.create())
    loadVerb(verbs.TURN_RIGHT, turnrightverb.create())
end
function M.getVerb(verbId)
    return repository[verbId]
end
return M