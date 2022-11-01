local keymap = vim.keymap

keymap.set("n", "<C-p>", ":Telescope<CR>")
--keymap.set("n", "<C-p>", function() require('telescope.builtin').git_files() end)
keymap.set("n", "<leader>pf", function() require('telescope.builtin').find_files() end)
