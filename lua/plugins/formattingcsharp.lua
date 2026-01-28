return {
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = { "BufWritePre" }, -- Loads plugin on save, but won't auto-format without the option
        cmd = { "ConformInfo" },
        opts = function(_, opts)
            opts.formatters_by_ft = opts.formatters_by_ft or {}
            -- ========================================
            -- C# / .NET
            -- ========================================
            opts.formatters_by_ft.cs = { "csharpier" }
            opts.formatters_by_ft.csproj = { "csharpier" }
            -- ========================================
            -- Web Development
            -- ========================================
            opts.formatters_by_ft.javascript = { "prettier" }
            opts.formatters_by_ft.typescript = { "prettier" }
            opts.formatters_by_ft.javascriptreact = { "prettier" }
            opts.formatters_by_ft.typescriptreact = { "prettier" }
            opts.formatters_by_ft.css = { "prettier" }
            opts.formatters_by_ft.scss = { "prettier" }
            opts.formatters_by_ft.html = { "prettier" }
            opts.formatters_by_ft.json = { "prettier" }
            opts.formatters_by_ft.jsonc = { "prettier" }
            opts.formatters_by_ft.markdown = { "prettier" }
            opts.formatters_by_ft.yaml = { "prettier" }
            opts.formatters_by_ft["angular.html"] = { "prettier" }
            --=========
            --    -- idk R support?
            --=========
            opts.formatters_by_ft.r = { "styler" }
            opts.formatters_by_ft.rmd = { "styler" }
            -- ========================================
            -- Database / SQL
            -- ========================================
            opts.formatters_by_ft.sql = { "sqlfluff" }
            opts.formatters_by_ft.mysql = { "sqlfluff" }
            opts.formatters_by_ft.plsql = { "sqlfluff" }
            -- ========================================
            -- Scripting
            -- ========================================
            opts.formatters_by_ft.lua = { "stylua" }
            opts.formatters_by_ft.sh = { "shfmt" }
            opts.formatters_by_ft.bash = { "shfmt" }
            -- ========================================
            -- Formatter Configurations
            -- ========================================
            opts.formatters = opts.formatters or {}
            opts.formatters.csharpier = {
                command = "dotnet-csharpier",
                args = { "--write-stdout" },
            }
            opts.formatters.prettier = {
                args = { "--prose-wrap", "always", "--tab-width", "4" },
            }
            opts.formatters.stylua = {
                args = { "--indent-type", "Spaces", "--indent-width", "4", "-" },
            }
            opts.formatters.sqlfluff = {
                args = { "format", "--dialect=postgres", "-" },
            }
        end,
    },
}
