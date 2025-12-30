return {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
    keys = {
        {
            "<leader>bd",
            "<cmd>Bdelete<cr>",
            desc = "Delete buffer (keep layout)",
        },
    },
}
