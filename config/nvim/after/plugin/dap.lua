local ok, dap = pcall(require, "dap")
if not ok then
    return
end

-- I like it, ty tj
vim.fn.sign_define("DapBreakpoint", { text = "ß", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ü", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "ඞ", texthl = "Error" })

--dap.txt + dap-ui
dap.adapters.nlua = function(callback, config)
    callback({
        type = 'server',
        host = config.host or "127.0.0.1",
        port = config.port or 8086
    })
end

dap.configurations.lua = {
    {
        type = 'nlua',
        request = 'attach',
        name = "Attach to running Neovim instance",
    }
}

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode-14',
    name = 'lldb'
}

dap.configurations.rust = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        runInTerminal = false,
    },
}
dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

-- require('dap-go').setup()

require("nvim-dap-virtual-text").setup {
    enabled = true,

    -- DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, DapVirtualTextForceRefresh
    enabled_commands = false,

    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_changed_variables = true,
    highlight_new_as_changed = true,

    -- show stop reason when stopped for exceptions
    show_stop_reason = true,

    -- prefix virtual text with comment string
    commented = false,

    only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
    all_references = false,       -- show virtual text on all all references of the variable (not only definitions)

    -- experimental features:
    virt_text_pos = "eol",  -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
}

local dap_ui = require "dapui"
_ = dap_ui.setup {
    layouts = {
        {
            elements = {
                "stacks",
                "scopes",
                "breakpoints",
                "watches",
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                "repl",
                --"console",
            },
            size = 10,
            position = "bottom",
        },
    },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
end

-- Keymaps --
local nmap = require("obimel.keymap").nmap

nmap { '<F1>', function() require "osv".launch({ port = 8086 }) end } --
--or
--nmap { '<F1>', function() require "osv".run_this() end } --
nmap { "<F4>", function() dap_ui.toggle(1) end }
nmap { "<F5>", function() dap_ui.toggle(2) end }
nmap { "<Up>", dap.continue }
nmap { "<Down>", dap.step_over }
nmap { "<Right>", dap.step_into }
nmap { "<Left>", dap.step_out }
nmap { '<Leader>dr', require('dap').repl.open }
nmap { '<Leader>dl', require('dap').run_last }
nmap { "<Leader>b", dap.toggle_breakpoint }
nmap { "<Leader>B", function()
    dap.set_breakpoint(vim.fn.input('Breakpoint cond: '))
end }
--nmap { '<F12>', [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true } }
