return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
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

        -- 1. Setup UI
        ui.setup()

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
                        -- Auto-detect bin/Debug dll if possible, else prompt
                        return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                },
            }
        end

        -- 3. C++ Adapter Setup (CodeLLDB)
        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                -- Point to the Mason install path
                command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                args = { "--port", "${port}" },
            },
        }
        -- C++ Config
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp
    end,
}
