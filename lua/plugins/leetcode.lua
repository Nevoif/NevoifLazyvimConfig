local leet_arg = "leetcode.nvim"

return {
    {
        "kawre/leetcode.nvim",
        lazy = leet_arg ~= vim.fn.argv(0, -1),
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            arg = leet_arg,
            lang = "csharp", -- Set C# as default

            cn = {
                enabled = false,
            },

            storage = {
                home = vim.fn.stdpath("data") .. "/leetcode",
                cache = vim.fn.stdpath("cache") .. "/leetcode",
            },

            picker = { provider = "telescope" },

            -- Visual settings
            description = {
                position = "left",
                width = "40%",
                show_stats = true,
            },

            console = {
                open_on_runcode = true,
                dir = "row",
                size = { width = "90%", height = "75%" },
            },

            -- Injector: Useful if you want default "using" statements
            injector = {
                ["csharp"] = {
                    before = { "using System;", "using System.Collections.Generic;", "using System.Linq;" },
                },
            },
        },
    },
}
