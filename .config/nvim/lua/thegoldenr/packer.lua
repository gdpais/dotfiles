return require('packer').startup(function(use)
    use("wbthomason/packer.nvim")

    --All the stuff
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-lualine/lualine.nvim")
    use("nvim-telescope/telescope.nvim")
    use("ThePrimeagen/harpoon")

    --Completion
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp")
    use { "tzachar/cmp-tabnine",  run = "./install.sh" , requires = "hrsh7th/nvim-cmp"}
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("onsails/lspkind-nvim")
    use("simrat39/symbols-outline.nvim")
    use "simrat39/symbols-outline.nvim"

    use("TimUntersberger/neogit")
    use("ThePrimeagen/git-worktree.nvim")
    use("sindrets/diffview.nvim")

    --Highlighting
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    --use('nvim-treesitter/playground') -- Change treesitter colors
    use { "norcalli/nvim-colorizer.lua" , config = function () require'colorizer'.setup() end }

    --Colorscheme
    use("folke/tokyonight.nvim")

    --Markdown
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
