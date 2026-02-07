return {
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = function(_, opts)
            opts.formatters_by_ft = opts.formatters_by_ft or {}

            -- C# / .NET
            opts.formatters_by_ft.cs = { "csharpier" }
            opts.formatters_by_ft.csproj = { "csharpier" }

            -- Web Development
            local prettier_langs = {
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
                "css",
                "scss",
                "html",
                "json",
                "jsonc",
                "yaml",
            }
            for _, lang in ipairs(prettier_langs) do
                opts.formatters_by_ft[lang] = { "prettier" }
            end
            opts.formatters_by_ft["angular.html"] = { "prettier" }

            -- R / Data Science
            opts.formatters_by_ft.r = { "styler" }
            opts.formatters_by_ft.rmd = { "styler" }

            -- Database / SQL
            local sql_langs = { "sql", "mysql", "plsql" }
            for _, lang in ipairs(sql_langs) do
                opts.formatters_by_ft[lang] = { "sqlfluff" }
            end

            -- Scripting
            opts.formatters_by_ft.lua = { "stylua" }
            opts.formatters_by_ft.sh = { "shfmt" }
            opts.formatters_by_ft.bash = { "shfmt" }

            -- Formatter Configurations
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
