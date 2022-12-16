require('nvim-treesitter.configs').setup {
    -- This really needs to be changed :'(
    ensure_installed = "all",
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
