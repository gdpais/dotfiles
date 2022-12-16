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
                },
            },
        },

    }
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("git_worktree")

-- functions 
local M = {}

function M.reload_modules()
    -- stolen from prime/Tj <3
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

M.find_anything = function()
    require("telescope.builtin").find_files({
        hidden = true,
    })
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles >",
        cwd = "~/.config/",
        hidden = true,
    })
end

M.search_nvim = function()
    require("telescope.builtin").find_files({
        prompt_title = "< neovim_cfg >",
        cwd = "~/.config/nvim",
        hidden = true,
    })
end

M.search_notebook = function()
    require("telescope.builtin").find_files({
        prompt_title = "< MyNotebook >",
        cwd = "~/personal/mynotebook",
        hidden = true,
    })
end

M.search_work = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Work >",
        cwd = "~/work",
        previewer = false,
    })
end

M.live_grep = function()
    require("telescope.builtin").live_grep {
        previewer = false,
    }
end

M.grep_str = function()
    require("telescope.builtin").grep_string {
        --previewer = false,
        hide = true,
        shorten_path = false,
    }
end

-- git stuff
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<C-d>", actions.git_delete_branch)
            map("n", "<C-d>", actions.git_delete_branch)
            return true
        end,
    })
end

M.git_files = function()
    require("telescope.builtin").git_files()
end

M.git_status = function()
    require("telescope.builtin").git_status({
        shorten_path = false,
    })
end

M.git_commits = function()
    require("telescope.builtin").git_commits {
        winblend = 5,
    }
end

-- Not used ATM
--M.lsp_references = function()
--    require("telescope.builtin").lsp_references {
--        layout_strategy = "vertical",
--        layout_config = {
--            prompt_position = "top",
--        },
--        sorting_strategy = "ascending",
--        ignore_filename = false,
--    }
--end
--
--M.lsp_implementations = function()
--    require("telescope.builtin").lsp_implementations {
--        layout_strategy = "vertical",
--        layout_config = {
--            prompt_position = "top",
--        },
--        sorting_strategy = "ascending",
--        ignore_filename = false,
--    }
--end

return M
