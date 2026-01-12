return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    cmd = { "AvanteChat", "AvanteToggle", "AvanteAsk" },
    version = false,
    opts = {
        provider = "copilot",
    },
    build = "make",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "zbirenbaum/copilot.lua",
    },
}
