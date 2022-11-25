local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
    return
end

local remap = require("thegoldenr.keymap")
local nmap = remap.nmap
local imap = remap.imap

local autocmd = require("tj.auto").autocmd
local autocmd_clear = vim.api.nvim_clear_autocmds
local semantic = vim.F.npcall(require, "nvim-semantic-tokens")
--local telescope_mapper = require "tj.telescope.mappings"
--local handlers = require "tj.lsp.handlers"


local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })
local augroup_codelens = vim.api.nvim_create_augroup("custom-lsp-codelens", { clear = true })
local augroup_format = vim.api.nvim_create_augroup("custom-lsp-format", { clear = true })
local augroup_semantic = vim.api.nvim_create_augroup("custom-lsp-semantic", { clear = true })

local autocmd_format = function(async, filter)
  vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    callback = function()
      vim.lsp.buf.format { async = async, filter = filter }
    end,
  })
end

local filetype_attach = setmetatable({
  go = function()
    autocmd_format(false)
  end,

  css = function()
    autocmd_format(false)
  end,

  rust = function()
    autocmd_format(false)
  end,

  typescript = function()
    autocmd_format(false, function(client)
      return client.name ~= "tsserver"
    end)
  end,
}, {
  __index = function()
    return function() end
  end,
})

local nnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  nmap(opts)
end

local inoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  imap(opts)
end

local custom_attach = function(client, bufnr)
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")

    inoremap { "<C-s>", vim.lsp.buf.signature_help }
    nnoremap { "K", vim.lsp.buf.hover }
    nnoremap { "gd", vim.lsp.buf.definition }
    nnoremap { "gD", vim.lsp.buf.declaration }
    nnoremap { "gt", vim.lsp.buf.type_definition }
    nnoremap { "gi", vim.lsp.buf.implementation }
    nnoremap { "gr", "<cmd>Telescope lsp_references<CR>" }
    nnoremap { "<space>dk", vim.diagnostic.goto_prev }
    nnoremap { "<space>dj", vim.diagnostic.goto_next }
    nnoremap { "<leader>r", vim.lsp.buf.rename }
    nnoremap { "<space>dl", "<cmd>Telescope diagnostics<CR>" }
    nnoremap { "<space>dl", "<cmd>Telescope diagnostics<CR>" }

    if filetype ~= "lua" then
        nnoremap { "K", vim.lsp.buf.hover, { desc = "lsp:hover" } }
    end

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
    local caps = client.server_capabilities

    -- Set autocommands conditional on server_capabilities
    if caps.documentHighlightProvider then
        autocmd_clear { group = augroup_highlight, buffer = bufnr }
        autocmd { "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, buffer = bufnr }
        autocmd { "CursorMoved", augroup_highlight, vim.lsp.buf.clear_references, buffer = bufnr }
    end

    if false and caps.codeLensProvider then
        if filetype ~= "elm" then
            autocmd_clear { group = augroup_codelens, buffer = bufnr }
            autocmd { "BufEnter", augroup_codelens, vim.lsp.codelens.refresh, bufnr, once = true }
            autocmd { { "BufWritePost", "CursorHold" }, augroup_codelens, vim.lsp.codelens.refresh, bufnr }
        end
    end

    if semantic and caps.semanticTokensProvider and caps.semanticTokensProvider.full then
        autocmd_clear { group = augroup_semantic, buffer = bufnr }
        autocmd { "TextChanged", augroup_semantic, vim.lsp.buf.semantic_tokens_full, bufnr }
    end

  -- Attach any filetype specific options to the client
  filetype_attach[filetype](client)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }

local servers = {
  -- Also uses `shellcheck` and `explainshell`
  bashls = true,

  eslint = true,
  gdscript = true,
  -- graphql = true,
  html = true,
  pyright = true,
  vimls = true,
  yamlls = true,

  cmake = (1 == vim.fn.executable "cmake-language-server"),
  dartls = pcall(require, "flutter-tools"),

  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
    init_options = {
      clangdFileStatus = true,
    },
  },

  gopls = {
    settings = {
      gopls = {
        codelenses = { test = true },
      },
    },

    flags = {
      debounce_text_changes = 200,
    },
  },

  omnisharp = {
    cmd = { vim.fn.expand "~/build/omnisharp/run", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  },

  rust_analyzer = {
    "rustup", "run", "nightly", "rust-analyzer"
  },

  racket_langserver = true,

  elmls = true,
  cssls = true,
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },

    on_attach = function(client)
      custom_attach(client)

    end,
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = nil,
    },
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

