return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    opts = {
        heading = {
            enabled = true,
            sign = true,
            icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        },
        code = {
            sign = false,
            width = "block",
            right_pad = 1,
            border = "above",
            left_margin = 1,
        },
        bullet = {
            enabled = true,
            icons = { "●", "○", "◆", "◇" },
        },
        table = {
            enabled = true,
        },
        link = {
            enabled = true,
        },
    },
}
