return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pylsp = {
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = { enabled = false },
                                pydocstyle = { enabled = false },
                                pyflakes = { enabled = true },
                                mccabe = { enabled = false },
                                autopep8 = { enabled = false },
                                pylint = { enabled = false },
                                jedi_completion = { enabled = true },
                            },
                        },
                    },
                },
            },
        },
    },

    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = { "nvim-neotest/neotest-python" },
        opts = function(_, opts)
            opts.adapters = opts.adapters or {}
            table.insert(
                opts.adapters,
                require("neotest-python")({
                    dap = {
                        justMyCode = false,
                        console = "integratedTerminal",
                    },
                    args = { "--tb=short" },
                    runner = "pytest",
                })
            )
        end,
    },

    {
        "mfussenegger/nvim-dap",
        optional = true,
        config = function()
            local dap = require("dap")

            -- Setup Python adapter using debugpy
            if not dap.adapters["python"] then
                dap.adapters["python"] = {
                    type = "executable",
                    command = vim.fn.exepath("python"),
                    args = { "-m", "debugpy.adapter" },
                }
            end

            dap.configurations.python = {
                {
                    type = "python",
                    name = "Launch file",
                    request = "launch",
                    program = "${file}",
                    pythonPath = function()
                        -- Auto-detect Python interpreter
                        local venv = os.getenv("VIRTUAL_ENV")
                        if venv then
                            return venv .. "/bin/python"
                        else
                            return vim.fn.exepath("python") or vim.fn.exepath("python3")
                        end
                    end,
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    justMyCode = false,
                },
                {
                    type = "python",
                    name = "Attach to process",
                    request = "attach",
                    processId = require("dap.utils").pick_process,
                    pythonPath = function()
                        local venv = os.getenv("VIRTUAL_ENV")
                        if venv then
                            return venv .. "/bin/python"
                        else
                            return vim.fn.exepath("python") or vim.fn.exepath("python3")
                        end
                    end,
                },
                {
                    type = "python",
                    name = "Launch pytest",
                    request = "launch",
                    module = "pytest",
                    args = { "${file}", "-v" },
                    console = "integratedTerminal",
                    justMyCode = false,
                    cwd = "${workspaceFolder}",
                    pythonPath = function()
                        local venv = os.getenv("VIRTUAL_ENV")
                        if venv then
                            return venv .. "/bin/python"
                        else
                            return vim.fn.exepath("python") or vim.fn.exepath("python3")
                        end
                    end,
                },
            }
        end,
    },

    {
        "nvim-neotest/neotest",
        optional = true,
        keys = {
            {
                "<leader>ptn",
                function()
                    require("neotest").run.run()
                end,
                desc = "Python Test: Run Nearest",
            },
            {
                "<leader>pts",
                function()
                    require("neotest").run.run({ strategy = "dap" })
                end,
                desc = "Python Test: Debug Nearest",
            },
            {
                "<leader>ptf",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "Python Test: Run File",
            },
            {
                "<leader>pta",
                function()
                    require("neotest").run.run(vim.fn.getcwd())
                end,
                desc = "Python Test: Run All",
            },
            {
                "<leader>pto",
                function()
                    require("neotest").output_panel.toggle()
                end,
                desc = "Python Test: Toggle Output",
            },
        },
    },

    --visual environment selector btw
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python" },
        lazy = false,
        opts = {
            auto_refresh = true,
            fd_binary_name = "fd",
        },
        keys = {
            {
                "<leader>pv",
                "<cmd>VenvSelect<cr>",
                desc = "Python: Select Virtual Environment",
            },
        },
    },
}
