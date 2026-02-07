return {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufRead package.json",
    opts = {
        colors = {
            up_to_date = "#3C4048",
            outdated = "#d19a66",
        },
        icons = {
            enable = true,
            style = {
                up_to_date = "|  ",
                outdated = "|  ",
            },
        },
    },
}
