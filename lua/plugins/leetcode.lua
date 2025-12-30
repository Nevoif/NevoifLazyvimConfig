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
            lang = "csharp",
            cn = { enabled = false },

            storage = {
                home = vim.fn.stdpath("data") .. "/leetcode",
                cache = vim.fn.stdpath("cache") .. "/leetcode",
            },

            -- Add keymaps for convenience
            keys = {
                toggle = { "q" },
                confirm = { "<CR>" },
            },

            hooks = {
                -- Auto-save before running/submitting
                ["enter"] = function()
                    vim.cmd("silent! wa")
                end,
            },

            description = {
                position = "left",
                width = "40%",
                show_stats = true,
            },

            console = {
                open_on_runcode = true,
                dir = "row",
                size = { width = "90%", height = "75%" },
                result = {
                    size = "60%",
                },
            },

            injector = {
                ["csharp"] = {
                    before = {
                        "using System;",
                        "using System.Collections.Generic;",
                        "using System.Linq;",
                        "using System.Text;", -- Often needed
                    },
                },
            },
        },

        -- Optional: Add key mappings for quick access
        keys = {
            { "<leader>rq", "<cmd>Leet list<cr>", desc = "LeetCode Question List" },
            { "<leader>rr", "<cmd>Leet run<cr>", desc = "LeetCode Run" },
            { "<leader>rs", "<cmd>Leet submit<cr>", desc = "LeetCode Submit" },
            { "<leader>rd", "<cmd>Leet desc<cr>", desc = "LeetCode Description" },
        },
    },
}
