local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local darkMagic = augroup("DarkMagic", {})

autocmd("BufWritePre", {
    group = darkMagic,
    pattern = "*",
    command = [[%s/\s\+$//e]]
})
