return {
  {
    "stevearc/overseer.nvim",
    lazy = true,
    cmd = { "OverseerOpen", "OverseerRun", "OverseerToggle", "OverseerQuickAction" },
    keys = {
      { "<leader>ov", "<cmd>OverseerToggle<cr>", desc = "Overseer: Toggle" },
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Overseer: Run Task" },
      { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Overseer: Quick Action" },
    },
    config = function()
      require("overseer").setup({
        templates = { "builtin" },
        actions = { "builtin" },
        task_list = {
          direction = "bottom",
          min_height = 25,
          max_height = 40,
          default_detail = 1,
        },
      })

      require("overseer").register_template({
        name = "dotnet: watch run",
        builder = function()
          return {
            cmd = "dotnet",
            args = { "watch", "run" },
            components = { "on_output_summarize", "on_exit_set_status" },
          }
        end,
        condition = {
          filetype = { "cs", "csproj" },
          callback = function(search)
            return vim.fn.glob(search.dir .. "/*.csproj") ~= ""
          end,
        },
      })

      require("overseer").register_template({
        name = "dotnet: test watch",
        builder = function()
          return {
            cmd = "dotnet",
            args = { "test", "--watch" },
            components = { "on_output_summarize", "on_exit_set_status" },
          }
        end,
        condition = {
          filetype = { "cs", "csproj" },
          callback = function(search)
            return vim.fn.glob(search.dir .. "/*.csproj") ~= ""
          end,
        },
      })

      require("overseer").register_template({
        name = "dotnet: build and test",
        builder = function()
          return {
            cmd = "bash",
            args = { "-c", "dotnet build && dotnet test" },
            components = { "on_output_summarize", "on_exit_set_status" },
          }
        end,
        condition = {
          filetype = { "cs", "csproj" },
          callback = function(search)
            return vim.fn.glob(search.dir .. "/*.csproj") ~= ""
          end,
        },
      })

      require("overseer").register_template({
        name = "dotnet: ef migrations add",
        builder = function(params)
          return {
            cmd = "dotnet",
            args = { "ef", "migrations", "add", params.name or "NewMigration" },
            components = { "on_output_summarize", "on_exit_set_status" },
          }
        end,
        params = {
          name = {
            optional = false,
            type = "string",
            description = "Migration name",
          },
        },
        condition = {
          filetype = { "cs" },
        },
      })

      require("overseer").register_template({
        name = "dotnet: ef database update",
        builder = function()
          return {
            cmd = "dotnet",
            args = { "ef", "database", "update" },
            components = { "on_output_summarize", "on_exit_set_status" },
          }
        end,
        condition = {
          filetype = { "cs" },
        },
      })

      require("overseer").register_template({
        name = "postgres: psql interactive",
        builder = function()
          local conn_string = os.getenv("DATABASE_URL") or string.format(
            "postgresql://%s:%s@localhost:5432/postgres",
            os.getenv("POSTGRES_USER") or "postgres",
            os.getenv("POSTGRES_PASSWORD") or "postgres"
          )
          return {
            cmd = "psql",
            args = { conn_string },
            components = { "on_output_summarize" },
          }
        end,
        condition = {
          filetype = { "sql", "plsql" },
        },
      })

      require("overseer").register_template({
        name = "postgres: run sql file",
        builder = function()
          return {
            cmd = "psql",
            args = { os.getenv("DATABASE_URL") or "postgresql://localhost/postgres", "-f", vim.fn.expand("%") },
            components = { "on_output_summarize", "on_exit_set_status" },
          }
        end,
        condition = {
          filetype = { "sql" },
        },
      })
    end,
    opts = {},
  },
}