return {
    {
        "rcarriga/nvim-notify",
        lazy = false,
        priority = 100,
        config = function(_, opts)
            local notify = require("notify")
            notify.setup(opts)
            
            -- Set nvim-notify as the default notifier so it captures all messages
            vim.notify = notify
            
            -- Keymap to show notification history
            vim.keymap.set("n", "<leader>n", function()
                require("telescope").extensions.notify.notify()
            end, { desc = "Show notification history" })
        end,
        opts = {
            position = "top_right",
            timeout = 2500,
            fps = 60,
            render = "minimal",
            background_colour = "#000000",
            max_height = function()
                return math.floor(vim.o.lines * 0.5000)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.5000)
            end,
            history_size = 100,
        },
    },
}
