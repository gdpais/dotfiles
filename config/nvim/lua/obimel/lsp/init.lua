local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
    return
end

local remap = require("obimel.keymap")
local nmap = remap.nmap
--local imap = remap.imap

local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function()
            local opts = { buffer = 0 }
            --imap { "<C-s>", vim.lsp.buf.signature_help, opts }
            nmap { "K", vim.lsp.buf.hover, opts }
            nmap { "gd", vim.lsp.buf.definition, opts }
            nmap { "gD", vim.lsp.buf.declaration, opts }
            nmap { "gt", vim.lsp.buf.type_definition, opts }
            nmap { "gi", vim.lsp.buf.implementation, opts }
            nmap { "gr", "<cmd>Telescope lsp_references<CR>", opts }
            nmap { "<space>dk", vim.diagnostic.goto_prev, opts }
            nmap { "<space>dj", vim.diagnostic.goto_next, opts }
            nmap { "<leader>r", vim.lsp.buf.rename, opts }
            nmap { "<space>dl", "<cmd>Telescope diagnostics<CR>", opts }
		end,
	}, _config or {})
end

require("lspconfig").tsserver.setup(config())

require("lspconfig").ccls.setup(config())

require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

require("lspconfig").rust_analyzer.setup(config({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
}))

local sumneko_root_path = "/home/gabs/personal/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
require("lspconfig").sumneko_lua.setup(config({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))

require("symbols-outline").setup({
    highlight_hovered_item = true,
    show_guides = true,
})
