local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    return
end

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
})

--lsp.preset('recommended')
lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Insert }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-y>"] = cmp.mapping.confirm( {select = true } ),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

local keymaps = require("obimel.keymap")
local imap = keymaps.imap
local nmap = keymaps.nmap

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    nmap { "K", vim.lsp.buf.hover, opts }
    nmap { "gd", vim.lsp.buf.definition, opts }
    nmap { "gD", vim.lsp.buf.declaration, opts }
    nmap { "gt", vim.lsp.buf.type_definition, opts }
    nmap { "gi", vim.lsp.buf.implementation, opts }
    nmap { "gr", "<cmd>Telescope lsp_references<CR>", opts }
    nmap { "[d", vim.diagnostic.goto_prev, opts }
    nmap { "]d", vim.diagnostic.goto_next, opts }
    nmap { "<leader>r", vim.lsp.buf.rename, opts }
    nmap { "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts }
    nmap { "<leader>ca", vim.lsp.buf.code_action, opts }
    nmap { "<leader>ss", vim.lsp.buf.workspace_symbol, opts }
    nmap { "<leader>sd", vim.diagnostic.open_float, opts }
    imap { "<C-h>", vim.lsp.buf.signature_help, opts }
end)

lsp.nvim_workspace()
lsp.setup()
