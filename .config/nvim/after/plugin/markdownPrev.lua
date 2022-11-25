local nmap = require("thegoldenr.keymap").nmap
local silent = { silent = true }

nmap { "<leader>m", ":MarkdownPreviewToggle<CR>" , silent }
