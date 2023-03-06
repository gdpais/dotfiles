local opt = vim.opt

-- general
opt.wrap = true
opt.belloff = "all"
opt.scrolloff = 8
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showcmd = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"
-- numbering
opt.nu = true
opt.relativenumber = true
-- tabs
opt.autoindent = true
opt.breakindent = true -- eyes saver
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true
opt.cindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- search
opt.smartindent = true
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
-- backups
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
-- split preferences
opt.splitright = false
opt.splitbelow = true

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

