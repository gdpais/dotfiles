local keymap = require "obimel.keymap"
local nmap = keymap.nmap
local imap = keymap.imap
local vmap = keymap.vmap

-- Copy entire buffer.
nmap { "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" } }
vim.keymap.set("x", "<leader>pp", "\"_dP", { desc = "paste saving last register"})

-- Move lines
vmap { "K", ":m '<-2<CR>gv=gv", { desc = "move line up" } }
vmap { "J", ":m '>+1<CR>gv=gv", { desc = "move line down" } }
nmap { "J", "mzJ`z", { desc = "append the nex line into the current one" } }

-- Search
--nmap { "<C-k>", "<cmd>cnext<CR>zz", {desc ="get next + center screen"} }
--nmap { "<C-j>", "<cmd>cprev<CR>zz", {desc ="get previous + center screen"} }
nmap { "<leader>k", "<cmd>lnext<CR>zz", {desc ="get next + center screen"} }
nmap { "<leader>j", "<cmd>lprev<CR>zz", {desc ="get previous + center screen"} }

-- Replace
nmap { "<leader>sc", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "replace word under the cursor (all file)" }}

-- Scroll & Centering
nmap { "<C-u>" ,"<C-u>zz", { desc = "half page up + center screen" } }
nmap { "<C-d>","<C-d>zz", { desc = "half page down + center screen" } }
nmap { "n","nzzzv", { desc = "search next + center screen" } }
nmap { "N","Nzzzv", { desc = "search prev + center screen" } }

-- Netrw (:Explore)
nmap { "<leader>ef", ":Explore<CR>", { desc = "Open Netrw in full size" } }
nmap { "<leader>ee", ":Lexplore<CR>", { desc = "Open Netrw in the working dir" } }
nmap { "<leader>ec", ":Lexplore %:p:h<CR>", { desc = "Open Netrw in the dir of the current file" } }
nmap { "<leader>ew", ":Ex ~/work<CR>", { desc = "Open full size Netrw in my work dir" } }
nmap { "<leader>ep", ":Ex ~/personal<CR>", { desc = "Open full size Netrw in my personal dir" } }

-- Tab
nmap { "<leader>cn", "<cmd>tabc<CR>", { desc = "Tab close" } }

-- MarkdownPreview
nmap { "<leader>m", ":MarkdownPreviewToggle<CR>", { desc = "Toggles markdown preview" }  }

-- Save & Quit
nmap { "<leader>w", "<cmd>update<CR>", { desc = "save buffer" } }
nmap { "<leader>q", "<cmd>wq!<CR>", { desc = "save and quit"} }
nmap { "<leader>Q", "<cmd>q!<CR>", { desc = "force quit" } }

-- Spell check
-- Toggle spell checking
nmap { "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" } }
imap { "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" } }

-- Make executable file
nmap { "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true } }

--Exit insert mode
imap { "<C-c>", "<ESC>", { desc = "exit insert mode" } }
