if not pcall(require, "telescope") then
    return
end

local actions = require "telescope.actions"
--local themes = require "telescope.themes"

require("telescope").setup({
    defaults = {
        prompt_prefix = " > ",
        color_devicons = true,
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        winblend = 5,
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.95,
            height = 0.85,
            prompt_position = "top",
            horizontal = {
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.4)
                    else
                        return math.floor(cols * 0.6)
                    end
                end,
                preview_cidth = 0.9,
            },
            vertical = {
                width = 0.9,
                height = 0.95,
                preview_height = 0.5,
            },
        },
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default,
                --["<C-e>"] = actions.results_scrolling_down,
                --["<C-y>"] = actions.results_scrolling_up,

                --["<C-k>"] = actions.cycle_history_next,
                --["<C-j>"] = actions.cycle_history_prev,
            },
            --n = {
            --["<C-e>"] = actions.results_scrolling_down,
            --["<C-y>"] = actions.results_scrolling_up,
            --},
        },
        history = {
            path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
            limit = 100,
        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                    -- more opts
                    borderchars = {
                        { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                        prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
                        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                    },
                },
            },
        },
    }
})

_ = require("telescope").load_extension "fzf"
_ = require("telescope").load_extension "dap"
_ = require("telescope").load_extension "ui-select"
_ = require("telescope").load_extension "git_worktree"
_ = require("telescope").load_extension "neoclip"
