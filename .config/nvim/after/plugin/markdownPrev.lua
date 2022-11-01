local keymap = vim.keymap
local silent = { silent = true }

keymap.set("n", "<leader>m", ":MarkdownPreviewToggle<CR>" , silent)
