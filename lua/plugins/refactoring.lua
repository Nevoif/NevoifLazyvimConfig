return {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        {
            "<leader>rx",
            function()
                require("refactoring").select_refactor()
            end,
            mode = { "n", "x" },
            desc = "Refactor",
        },
    },
    opts = {
        print_var_statements = true,
    },
}
