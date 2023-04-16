local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local darkMagic = augroup("DarkMagic", {})

-- remove extra spaces
autocmd("BufWritePre", {
    group = darkMagic,
    pattern = "*",
    command = [[%s/\s\+$//e]]
})

-- remove trailing lines
autocmd("BufWritePre", {
    group = darkMagic,
    pattern = "*",
    command = [[%s/$\n\+\%$//e]]
})

-- autoformat
autocmd("BufWritePre", {
    group = darkMagic,
    pattern = "*",
    callback = function()
        vim.lsp.buf.format {
            async = false,
        }
    end
})

local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = highlight_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})
