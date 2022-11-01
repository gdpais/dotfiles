-- general
vim.opt.wrap = true
vim.opt.errorbells = false
vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
-- numbering
vim.opt.nu = true
vim.opt.relativenumber = true
-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- search
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile =true

-- Leader
vim.g.mapleader = " "

-- Netrw
vim.g.netrw_winsize = 30
vim.g.netrw_localcopydircmd = 'cp -r'
