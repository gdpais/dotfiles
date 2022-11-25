local nmap = require("thegoldenr.keymap").nmap
local silent = { silent = true }

nmap { "<leader>a", function() require("harpoon.mark").add_file() end, silent }
nmap { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent }

nmap { "<A-h>", function() require("harpoon.ui").nav_file(1) end, silent }
nmap { "<A-j>", function() require("harpoon.ui").nav_file(2) end, silent }
nmap { "<A-k>", function() require("harpoon.ui").nav_file(3) end, silent }
nmap { "<A-l>", function() require("harpoon.ui").nav_file(4) end, silent }

nmap { "<A-,>", function() require("harpoon.ui").nav_prev() end, silent }
nmap { "<A-.>", function() require("harpoon.ui").nav_next() end, silent }
