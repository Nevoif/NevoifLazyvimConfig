return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    -- fixed offset encoding and disabled inlay hints
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
