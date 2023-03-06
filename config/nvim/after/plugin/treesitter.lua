require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "go",
        "help",
        "html",
        "javascript",
        "json",
        "markdown",
        "python",
        "query",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "lua"
    },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
