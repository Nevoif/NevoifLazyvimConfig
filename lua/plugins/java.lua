return {
    {
        "nvim-java/nvim-java",
        ft = { "java" },
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
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
                    settings = {
                        java = {
                            configuration = {
                                runtimes = {
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
