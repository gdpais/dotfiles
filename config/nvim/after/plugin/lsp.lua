local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    return
end

lsp.ensure_installed({
    'tsserver',
    'eslint',
    --'lua-language-server',
    'rust_analyzer',
})

--lsp.preset('recommended')
lsp.preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- example to setup lua_ls and enable call snippets
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            }
        }
    }
})

local cmp = require "cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Insert }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-m>"] = cmp.mapping.confirm({ select = true }),
    --["<C-Space>"] = cmp.mapping.complete(),
    ['<Tab>'] = vim.NIL,
    ['<S-Tab>'] = vim.NIL,
    ['<CR>'] = vim.NIL
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

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
        warn = 'w',
        hint = '⚑',
        info = 'i'
    }
})

local keymaps = require("obimel.keymap")
local imap = keymaps.imap
local nmap = keymaps.nmap
local attach_func = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    nmap { "K", vim.lsp.buf.hover, opts }
    imap { "<C-h>", vim.lsp.buf.signature_help, opts }
    nmap { "gs", vim.lsp.buf.signature_help, opts }
    nmap { "gd", vim.lsp.buf.definition, opts }
    nmap { "gD", vim.lsp.buf.declaration, opts }
    nmap { "<leader>D", vim.lsp.buf.type_definition, opts }
    nmap { "gI", vim.lsp.buf.implementation, opts }
    nmap { "gr", require("telescope.builtin").lsp_references, opts }

    --Diagnostics (may move this later)
    nmap { "[d", vim.diagnostic.goto_prev, opts }
    nmap { "]d", vim.diagnostic.goto_next, opts }
    nmap { "gl", vim.diagnostic.open_float, opts }
    nmap { "<leader>ll", vim.diagnostic.setloclist, { desc = "Open diagnostics list" } }
    --nmap { "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts } configured in telescope => <leader>pd

    nmap { "<leader>r", vim.lsp.buf.rename, opts }
    nmap { "<leader>ca", vim.lsp.buf.code_action, opts }

    nmap { "<leader>ss", vim.lsp.buf.workspace_symbol, opts }
    nmap { "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "[D]ocument [S]ymbols" } }
    nmap { "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" } } -- <leader>w already in use
    --nmap { '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder' }
    --nmap { '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder' }
    --nmap { '<leader>wl', function()
    --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --end, { desc = '[W]orkspace [L]ist Folders' } }

    -- Create a command `:Format` local to the LSP buffer
    -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --   vim.lsp.buf.format()
    -- end, { desc = 'Format current buffer with LSP' })
end

lsp.on_attach(attach_func)
require("sg").setup {
    on_attach = attach_func
}

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    --    signs = true,
    --    update_in_insert = false,
    --    underline = true,
    --    severity_sort = false,
    --    float = true,
})
