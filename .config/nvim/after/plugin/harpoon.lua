local keymap = vim.keymap
local silent = { silent = true }

keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, silent)
keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

keymap.set("n", "<A-h>", function() require("harpoon.ui").nav_file(1) end, silent)
keymap.set("n", "<A-j>", function() require("harpoon.ui").nav_file(2) end, silent)
keymap.set("n", "<A-k>", function() require("harpoon.ui").nav_file(3) end, silent)
keymap.set("n", "<A-l>", function() require("harpoon.ui").nav_file(4) end, silent)

keymap.set("n", "<A-,>", function() require("harpoon.ui").nav_prev() end, silent)
keymap.set("n", "<A-.>", function() require("harpoon.ui").nav_next() end, silent)
