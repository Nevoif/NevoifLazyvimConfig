return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        opts = {
            highlight = {
                "MyRainbow1",
                "MyRainbow2",
                "MyRainbow3",
                "MyRainbow4",
            },
        },
        config = function(_, opts)
            vim.g.rainbow_delimiters = opts
        end,
    },

    {
        "mawkler/modicator.nvim",
        opts = {
            show_warnings = false,
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        lazy = true,
        event = "VeryLazy",
        opts = {
            user_default_options = {
                names = false,
                RRGGBBAA = true,
                AARRGGBB = true,
                mode = "background",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
        },
    },

    {
        "b0o/incline.nvim",
        event = "VeryLazy",
        config = function()
            require("incline").setup({
                window = {
                    padding = 0,
                    margin = { horizontal = 0, vertical = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    local hl_group = modified and "InclineModified" or "InclineNormal"

                    return {
                        { " " },
                        { ft_icon, guifg = ft_color },
                        { " " },
                        { filename },
                        { " " },
                        group = hl_group,
                    }
                end,
            })
        end,
    },
}
