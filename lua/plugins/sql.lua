return {
    -- 1. Dadbod UI & Core
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_show_database_icon = 1

            vim.g.dbs = {}

            -- Try to load local connections first (gitignored, developer-specific)
            -- This allows each developer to have their own database configurations
            local ok, local_dbs = pcall(require, "local.db_connections")
            if ok and local_dbs then
                vim.g.dbs = local_dbs
            else
                -- Fallback to environment variables
                -- This is useful for CI/CD or simpler setups
                local pg_user = os.getenv("POSTGRES_USER")
                local pg_pass = os.getenv("POSTGRES_PASSWORD")

                if pg_user and pg_pass then
                    vim.g.dbs["Postgres: Learning"] =
                        string.format("postgresql://%s:%s@localhost:5432/learning", pg_user, pg_pass)
                    vim.g.dbs["Postgres: MyProject"] =
                        string.format("postgresql://%s:%s@localhost:5432/myproject_dev", pg_user, pg_pass)
                    vim.g.dbs["Postgres: TestDB"] =
                        string.format("postgresql://%s:%s@localhost:5432/testdb", pg_user, pg_pass)
                end
            end
        end,
        keys = {
            { "<leader>Dd", "<cmd>DBUIToggle<cr>", desc = "SQL: Toggle DB UI" },
            { "<leader>Dr", "<cmd>DB<cr>", desc = "SQL: Run Query", ft = { "sql", "mysql", "plsql" } },
            { "<leader>Da", "<cmd>DBUIAddConnection<cr>", desc = "SQL: Add Connection" }, -- ← Add this
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = function(_, opts)
            if opts.ensure_installed ~= "all" then
                opts.ensure_installed = opts.ensure_installed or {}
                vim.list_extend(opts.ensure_installed, { "sql" })
            end
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = { "kristijanhusak/vim-dadbod-completion" },
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, { name = "vim-dadbod-completion" })
        end,
    },
}
