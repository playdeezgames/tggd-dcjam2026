local verbs = require "business.verbs"
local turnleftverb = require "business.verbs.turnleftverb"
local turnrightverb= require "business.verbs.turnrightverb"
local moveverb     = require "business.verbs.moveverb"
local starveverb   = require "business.verbs.starveverb"
local leaveactionmenuverb = require "business.verbs.leaveactionmenuverb"
local enterinventoryverb  = require "business.verbs.enterinventoryverb"
local eatverb = require "business.verbs.eatverb"
local cleanverb = require "business.verbs.cleanverb"
local rinseverb = require "business.verbs.rinseverb"
local restverb = require "business.verbs.restverb"
local entergroundinventoryverb = require "business.verbs.entergroundinventoryverb"
local M = {}
local repository = {}
local function loadVerb(verbId, newVerb)
    repository[verbId] = newVerb
end
function M.load()
    loadVerb(verbs.TURN_LEFT, turnleftverb.create())
    loadVerb(verbs.TURN_RIGHT, turnrightverb.create())
    loadVerb(verbs.MOVE, moveverb.create())
    loadVerb(verbs.STARVE, starveverb.create())
    loadVerb(verbs.LEAVE_ACTION_MENU, leaveactionmenuverb.create())
    loadVerb(verbs.ENTER_INVENTORY, enterinventoryverb.create())
    loadVerb(verbs.EAT, eatverb.create())
    loadVerb(verbs.CLEAN, cleanverb.create())
    loadVerb(verbs.RINSE, rinseverb.create())
    loadVerb(verbs.REST, restverb.create())
    loadVerb(verbs.ENTER_GROUND_INVENTORY, entergroundinventoryverb.create())
end
function M.getVerb(verbId)
    return repository[verbId]
end
function M.getVerbs(c)
    local result = {}
    for k, v in pairs(repository) do
        if v:canSelect(c) then
            table.insert(result, k)
        end
    end
    return result
end
return M