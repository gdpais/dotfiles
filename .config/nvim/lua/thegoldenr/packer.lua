return require('packer').startup(function(use)
    use("wbthomason/packer.nvim")

    use("folke/tokyonight.nvim")
    use("nvim-lua/plenary.nvim")
    use("ThePrimeagen/harpoon")
    use("nvim-telescope/telescope.nvim")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use { "norcalli/nvim-colorizer.lua" , config = function () require'colorizer'.setup() end }
    use("nvim-lualine/lualine.nvim")
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }) --use('nvim-treesitter/playground') -- Change treesitter colors
    --use("neovim/nvim-lspconfig")
    --use("ms-jpq/coq_nvim")
end)
