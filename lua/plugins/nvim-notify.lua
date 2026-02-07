return {
    {
        "rcarriga/nvim-notify",
        lazy = true,
        event = "VeryLazy",
        opts = {
            position = "top_right",
            timeout = 2500,
            fps = 120,
            render = "minimal",
            background_colour = "#000000",
            max_height = function()
                return math.floor(vim.o.lines * 0.5000)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.5000)
            end,
        },
    },
}
