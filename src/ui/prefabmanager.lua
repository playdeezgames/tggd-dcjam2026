local M = {}
local repository = {}
local prefabs = require "ui.prefabs"
local prefab = require "ui.prefab"
local colors  = require "ui.colors"
local function createPrefab(prefabId, texts, foreground, background, transparent)
    repository[prefabId] = prefab.create(texts, foreground, background, transparent)
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
    createPrefab(
    prefabs.DEEP_SINK,
    {
"................",
"................",
"................",
"................",
"................",
"................",
".......\xdb........",
"...\xdb\xdb\xdb\xdb\xdb\xdb\xdb\xdb\xdb....",
"...\xdb   \xdb   \xdb....",
"...\xdb       \xdb....",
"...\xdb \xdb\xdb\xdb\xdb\xdb \xdb....",
"...\xdb\xdb\xdb\xdb\xdb\xdb\xdb\xdb\xdb....",
"...         ....",
"...\xdb \xdb\xdb\xdb\xdb\xdb \xdb....",
"...\xdb \xdb\xdb\xdb\xdb\xdb \xdb....",
"...\xdb       \xdb...."
    }, 
    colors.DARK_GRAY ,
    colors.LIGHT_GRAY,
    ".")
    createPrefab(
    prefabs.BED, 
    {
"................",
"................",
"................",
"................",
"................",
"......\xdb\xdb\xdb\xdb......",
"....\xdb \xdb\xdb\xdb\xdb \xdb....",
"....\xdb      \xdb....",
".... \xdb\xdb\xdb\xdb\xdb\xdb ....",
"....\xdb\xdb\xdb\xdb\xdb\xdb\xdb\xdb....",
"....\xdb\xdb\xdb\xdb\xdb\xdb\xdb\xdb....",
"....\xdb\xdb\xdb\xdb\xdb\xdb\xdb\xdb....",
"....        ....",
"....\xdb\xdb\xdb\xdb\xdb\xdb\xdb\xdb....",
"....  ....  ....",
"....\xdb\xdb....\xdb\xdb...."
    }, 
    colors.GREEN,
    colors.BLACK,
    ".")
end
function M.getPrefab(prefabId)
    return repository[prefabId]
end
return M