return {
    -- 1. LSP: BasedPyright (Intelligence) + Ruff (Linting/Formatting)
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "openFilesOnly",
                            },
                        },
                    },
                },
                ruff = {
                    cmd_env = { RUFF_TRACE = "messages" },
                    init_options = {
                        settings = {
                            logLevel = "error",
                        },
                    },
                    keys = {
                        {
                            "<leader>co",
                            function()
                                vim.lsp.buf.code_action({
                                    apply = true,
                                    context = {
                                        only = { "source.organizeImports" },
                                        diagnostics = {},
                                    },
                                })
                            end,
                            desc = "Organize Imports",
                        },
                    },
                },
            },
        },
    },

    -- 2. Formatting: Use Ruff to format
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format", "ruff_fix" },
            },
        },
    },

    -- 3. Testing: Neotest with Python adapter
    {
        "nvim-neotest/neotest",
        optional = false,
        dependencies = { "nvim-neotest/neotest-python" },
        opts = function(_, opts)
            opts.adapters = opts.adapters or {}
            table.insert(
                opts.adapters,
                require("neotest-python")({
                    dap = {
                        justMyCode = true,
                        console = "integratedTerminal",
                    },
                    args = { "--tb=short" },
                    runner = "pytest",
                })
            )
        end,
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

    -- 4. Debugging: DAP with debugpy
    {
        "mfussenegger/nvim-dap",
        optional = false,
        config = function()
            local dap = require("dap")

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
                        local venv = os.getenv("VIRTUAL_ENV")
                        if venv then
                            return venv .. "/bin/python"
                        else
                            return vim.fn.exepath("python") or vim.fn.exepath("python3")
                        end
                    end,
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    justMyCode = true,
                },
                {
                    type = "python",
                    name = "Launch pytest",
                    request = "launch",
                    module = "pytest",
                    args = { "${file}", "-v" },
                    console = "integratedTerminal",
                    justMyCode = true,
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

    -- 5. Virtual Environment Selector
    {
        "linux-cultist/venv-selector.nvim",
        ft = { "python" },
        dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python" },
        opts = {
            auto_refresh = true,
            fd_binary_name = "fd",
        },
        keys = {
            { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Python: Select Virtual Environment" },
        },
    },
}
