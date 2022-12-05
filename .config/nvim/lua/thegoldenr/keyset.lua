local keymap = vim.keymap

-- Copy entire buffer.
keymap.set("n", "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" })
keymap.set("x", "<leader>p", "\"_dP", { desc = "paste saving last register"})
-- Move lines
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line up" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line down" })

-- Search
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", {desc ="get next + center screen"})
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", {desc ="get previous + center screen"})
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc ="get next + center screen"})
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc ="get previous + center screen"})

-- Scroll & Centering
keymap.set("n", "<C-u>" ,"<C-u>zz", { desc = "half page up + center screen" })
keymap.set("n", "<C-d>","<C-d>zz", { desc = "half page down + center screen" })
keymap.set("n", "n","nzzzv", { desc = "search next + center screen" })
keymap.set("n", "N","Nzzzv", { desc = "search prev + center screen" })


-- Netrw (:Explore)
keymap.set("n", "<leader>ef", ":Explore<CR>", { desc = "Open Netrw in full size" })
keymap.set("n", "<leader>ee", ":Lexplore<CR>", { desc = "Open Netrw in the working dir" })
keymap.set("n", "<leader>ec", ":Lexplore %:p:h<CR>", { desc = "Open Netrw in the dir of the current file" })
keymap.set("n", "<leader>ew", ":Ex ~/work<CR>", { desc = "Open full size Netrw in my work dir" })
keymap.set("n", "<leader>ep", ":Ex ~/personal<CR>", { desc = "Open full size Netrw in my personal dir" })

-- MarkdownPreview
keymap.set("n", "<leader>m", ":MarkdownPreviewToggle<CR>", { desc = "Toggles markdown preview" } )

-- Save & Quit 
keymap.set("n", "<leader>w", "<cmd>update<CR>", { desc = "save buffer" })
keymap.set("n", "<leader>q", "<cmd>wq!<CR>", { desc = "save and quit"});
keymap.set("n", "<leader>Q", "<cmd>q!<CR>", {desc = "force quit"});

-- Spell check
-- Toggle spell checking
keymap.set("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
keymap.set("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })

-- Make executable file
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--Exit insert mode
keymap.set("i", "<C-c>", "<ESC>", { desc = "exit insert mode" })

