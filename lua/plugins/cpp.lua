return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--offset-encoding=utf-16",
                        "--inlay-hints=false",
                    },
                },
            },
        },
    },
}
