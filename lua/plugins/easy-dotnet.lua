return {
    {
        "GustavEikaas/easy-dotnet.nvim",
        lazy = true,
        ft = { "cs", "csproj", "sln" },
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
            require("easy-dotnet").setup({
                lsp = {
                    enabled = false,
                },
                test_runner = {
                    viewmode = "float",
                    enable_buffer_test_execution = true,
                },
            })

            vim.api.nvim_create_user_command("DotnetWatch", function()
                require("easy-dotnet").run_watch()
            end, { desc = "Run dotnet watch" })

            vim.api.nvim_create_user_command("DotnetEFMigrationsAdd", function()
                vim.fn.inputsave()
                local migration_name = vim.fn.input("Migration name: ")
                if migration_name ~= "" then
                    vim.fn.system("dotnet ef migrations add " .. migration_name)
                    vim.notify("Migration '" .. migration_name .. "' added", vim.log.levels.INFO)
                end
            end, { desc = "Add EF Core migration" })

            vim.api.nvim_create_user_command("DotnetEFDatabaseUpdate", function()
                vim.fn.system("dotnet ef database update")
                vim.notify("Database updated", vim.log.levels.INFO)
            end, { desc = "Update database with pending migrations" })

            vim.api.nvim_create_user_command("DotnetEFScaffold", function()
                vim.fn.inputsave()
                local connection = vim.fn.input("Connection string: ")
                local output_dir = vim.fn.input("Output directory (default: Models): ") or "Models"
                if connection ~= "" then
                    vim.fn.system("dotnet ef dbcontext scaffold \"" .. connection .. "\" Microsoft.EntityFrameworkCore.SqlServer -o " .. output_dir)
                    vim.notify("DbContext scaffolded to " .. output_dir, vim.log.levels.INFO)
                end
            end, { desc = "Scaffold DbContext from existing database" })

            vim.api.nvim_create_user_command("DotnetAddPackage", function()
                vim.fn.inputsave()
                local package = vim.fn.input("Package name: ")
                if package ~= "" then
                    vim.fn.system("dotnet add package " .. package)
                    vim.notify("Added package: " .. package, vim.log.levels.INFO)
                end
            end, { desc = "Add NuGet package" })
        end,
        keys = {
            {
                "<leader>B",
                function()
                    require("easy-dotnet").build_quickfix()
                end,
                desc = "Dotnet: Build Project",
            },
            {
                "<leader>dr",
                function()
                    require("easy-dotnet").run()
                end,
                desc = "Dotnet: Run Project",
            },
            {
                "<leader>dw",
                function()
                    require("easy-dotnet").run_watch()
                end,
                desc = "Dotnet: Watch + Hot Reload",
            },
            {
                "<leader>ds",
                function()
                    require("easy-dotnet").secrets()
                end,
                desc = "Dotnet: User Secrets",
            },
        },
    },
}
