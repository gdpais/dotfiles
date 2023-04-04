if not pcall(require, "nvim-treesitter") then
    return
end
local list = require("nvim-treesitter.parsers").get_parser_configs()
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "go",
        "vimdoc",
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
