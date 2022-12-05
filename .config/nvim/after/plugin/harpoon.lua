local ok, _ = pcall(require, "harpoon")

if not ok then
    return
end

local nmap = require("airborne.keymap").nmap
local silent = { silent = true }

nmap { "<leader>a", function() require("harpoon.mark").add_file() end, silent }
nmap { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent }

nmap { "<C-h>", function() require("harpoon.ui").nav_file(1) end, silent }
nmap { "<C-j>", function() require("harpoon.ui").nav_file(2) end, silent }
nmap { "<C-k>", function() require("harpoon.ui").nav_file(3) end, silent }
nmap { "<C-l>", function() require("harpoon.ui").nav_file(4) end, silent }

nmap { "<C-[>", function() require("harpoon.ui").nav_prev() end, silent }
nmap { "<C-]>", function() require("harpoon.ui").nav_next() end, silent }
