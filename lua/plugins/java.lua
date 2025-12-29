return {
    {
        "nvim-java/nvim-java",
        lazy = false,
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap", -- For debugging
        },
        config = function()
            require("java").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                jdtls = {
                    -- Your Mason config installs this, but nvim-java handles the launch command.
                    -- Any extra settings go here:
                    settings = {
                        java = {
                            configuration = {
                                runtimes = {
                                    -- If you have multiple Java versions, list them here.
                                    -- Neovim will auto-detect them if they are in standard paths.
                                    {
                                        name = "JavaSE-21",
                                        path = "/usr/lib/jvm/default",
                                    },
                                },
                            },
                        },
                    },
                },
            },
        },
    },
}
