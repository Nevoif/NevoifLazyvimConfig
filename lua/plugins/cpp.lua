return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    -- Optional: Fix offset encoding conflicts
                    cmd = { "clangd", "--offset-encoding=utf-16" },
                },
            },
        },
    },
}
