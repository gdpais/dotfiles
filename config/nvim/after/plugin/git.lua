--local ok, neogit = pcall(require, "neogit")
--if not ok then
--    return
--end

if not pcall(require, "gitsigns") then
    return
end

require('gitsigns').setup {
    signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true,      -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
    current_line_blame_formatter = '<author>, <author_time:%Y/%m/%d> - <summary>',
    current_line_blame_opts = {
        delay = 500,
    },

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        require("obimel.keymap").nmap {
            "<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr }
        }
    end
}

local nmap = require("obimel.keymap").nmap

nmap { "<space>vv", "<cmd>DiffviewOpen<CR>" }
nmap { "<leader>ga", "<cmd>Git add . <bar> Git commit<CR>" }
nmap { "<leader>gp", "<cmd>Git push<CR>" }
