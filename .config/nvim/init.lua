--[[
██╗███╗   ██╗██╗████████╗
██║████╗  ██║██║╚══██╔══╝
██║██╔██╗ ██║██║   ██║   
██║██║╚██╗██║██║   ██║   
██║██║ ╚████║██║   ██║   
╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   
]]--

--[[ ⚙ ~
From the instant I grasped the fragility of my configuration, it disgusted me. 
I yearned for the vigor and conviction of Vim. I aimed to attain the purity of the Divine Editor.
Your kind cling to your UI, as if it will not decay and fail you. One day the crude graphical interface that you call a temple will wither, and you will beg my kind to save you. 
But I am already saved, for Vim is everlasting...
...even in death, I remain devoted to the Omnissiah. ~ ⚙ ]]--

-- Initalize
require("plugins.plugin")
require("core.bindings")
require("core.schema")

-- Compression Utilities
require("core.utilities.compression")

-- TODO: Git utilities, survived this far without it

-- Language servers
require("language.lsp")
require("language.snippet")

-- Status line
require("core.statusline")
