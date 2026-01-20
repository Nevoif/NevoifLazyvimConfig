return {
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("quarto").setup({
                lspFeatures = {
                    enabled = true,
                    languages = { "r", "python", "julia" },
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                codeRunner = {
                    enabled = true,
                    default_method = "slime",
                },
            })
        end,
    },
    {
        "jpalardy/vim-slime",
        init = function()
            -- Use the Neovim built-in terminal
            vim.g.slime_target = "neovim"
            -- Optional: separate pane configuration if needed
            -- vim.g.slime_default_config = { jobid = 1 }
        end,
    },
}
