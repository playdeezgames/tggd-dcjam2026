local M = {}
local repository = {}
local prefabs = require "ui.prefabs"
local prefab = require "ui.prefab"
local colors  = require "ui.colors"
local function createPrefab(prefabId, texts, foreground, background)
    repository[prefabId] = prefab.create(texts, foreground, background)
end
function M.load()
    createPrefab(
    prefabs.AHEAD_WALL, 
    {
[[          ]],
[[          ]],
[[          ]],
[[          ]],
[[          ]],
[[+--------+]],
[[|        |]],
[[|        |]],
[[|        |]],
[[|        |]],
[[|        |]],
[[|        |]],
[[|        |]],
[[|        |]],
[[+--------+]],
[[          ]],
[[          ]],
[[          ]],
[[          ]],
[[          ]]        
    }, 
    colors.BLUE, 
    colors.LIGHT_BLUE)
    createPrefab(
    prefabs.LEFT_WALL, 
    {
[[\    ]],
[[ \   ]],
[[  \  ]],
[[   \ ]],
[[    \]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[    /]],
[[   / ]],
[[  /  ]],
[[ /   ]],
[[/    ]]        
    }, 
    colors.BLUE, 
    colors.LIGHT_BLUE)
    createPrefab(
    prefabs.RIGHT_WALL, 
    {
[[    /]],
[[   / ]],
[[  /  ]],
[[ /   ]],
[[/    ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[     ]],
[[\    ]],
[[ \   ]],
[[  \  ]],
[[   \ ]],
[[    \]]        
    }, 
    colors.BLUE, 
    colors.LIGHT_BLUE)
    createPrefab(
    prefabs.AHEAD_DOOR, 
    {
[[          ]],
[[          ]],
[[          ]],
[[          ]],
[[          ]],
[[+--------+]],
[[|        |]],
[[|        |]],
[[|  +--+  |]],
[[|  |  |  |]],
[[|  |  |  |]],
[[|  |  |  |]],
[[|  |  |  |]],
[[|  |  |  |]],
[[+--+  +--+]],
[[          ]],
[[          ]],
[[          ]],
[[          ]],
[[          ]]        
    }, 
    colors.BLUE, 
    colors.LIGHT_BLUE)
    createPrefab(
    prefabs.LEFT_DOOR, 
    {
[[\    ]],
[[ \   ]],
[[  \  ]],
[[+  \ ]],
[[|\  \]],
[[| +  ]],
[[| |  ]],
[[| |  ]],
[[| |  ]],
[[| |  ]],
[[| |  ]],
[[| |  ]],
[[| |  ]],
[[| |  ]],
[[| |  ]],
[[| | /]],
[[| |/ ]],
[[| +  ]],
[[|    ]],
[[+    ]]        
    }, 
    colors.BLUE, 
    colors.LIGHT_BLUE)
    createPrefab(
    prefabs.RIGHT_DOOR, 
    {
[[    /]],
[[   / ]],
[[  /  ]],
[[ /  +]],
[[/  /|]],
[[  + |]],
[[  | |]],
[[  | |]],
[[  | |]],
[[  | |]],
[[  | |]],
[[  | |]],
[[  | |]],
[[  | |]],
[[  | |]],
[[\ | |]],
[[ \| |]],
[[  + |]],
[[    |]],
[[    +]]        
    }, 
    colors.BLUE, 
    colors.LIGHT_BLUE)
end
function M.getPrefab(prefabId)
    return repository[prefabId]
end
return M