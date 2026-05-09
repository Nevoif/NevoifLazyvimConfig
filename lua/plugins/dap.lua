return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text", -- Required for inline variable values
        "mason-org/mason.nvim", -- Ensure Mason is ready
    },
    keys = {
        -- Global Debug Keys (Work for C#, C++, Java, Python)
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "DAP: Toggle Breakpoint",
        },
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "DAP: Continue",
        },
        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "DAP: Step Over",
        },
        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "DAP: Step Into",
        },
        {
            "<leader>du",
            function()
                require("dap").step_out()
            end,
            desc = "DAP: Step Out",
        },
        {
            "<leader>dy",
            function()
                require("dapui").toggle()
            end,
            desc = "DAP: Toggle UI",
        },
        {
            "<leader>dm",
            function()
                require("dap").repl.toggle()
            end,
            desc = "DAP: Toggle REPL",
        },
        {
            "<leader>dq",
            function()
                require("dap").terminate()
            end,
            desc = "DAP: Stop",
        },
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        -- 1. Setup UI & Virtual Text
        ui.setup()
        require("nvim-dap-virtual-text").setup({
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            show_stop_reason = true,
            commented = false,
        })

        -- Auto-open UI when debugging starts
        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end

        -- 2. C# Adapter Setup (NetCoreDbg)
        if not dap.adapters["netcoredbg"] then
            dap.adapters["netcoredbg"] = {
                type = "executable",
                command = vim.fn.exepath("netcoredbg"),
                args = { "--interpreter=vscode" },
            }
        end
        -- C# Config
        for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
            dap.configurations[lang] = {
                {
                    type = "netcoredbg",
                    name = "Launch file",
                    request = "launch",
                    program = function()
                        -- Auto-detect bin/Debug dll using fd (or standard globbing) to prevent manual typing
                        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                        local paths = vim.fn.glob(vim.fn.getcwd() .. "/bin/Debug/**/*.dll", false, true)
                        if #paths == 0 then
                            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
                        end
                        -- Try to find the dll that matches the project folder name (the executable)
                        for _, path in ipairs(paths) do
                            if path:match(project_name .. "%.dll$") then
                                return path
                            end
                        end
                        return paths[1] -- fallback
                    end,
                    cwd = "${workspaceFolder}",
                },
            }
        end
    end,
}
