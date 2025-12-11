return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.cs = { "csharpier" }

      -- Optional: Custom args if you don't use the global tool
      opts.formatters = opts.formatters or {}
      opts.formatters.csharpier = {
        command = "dotnet-csharpier", -- or just "csharpier" if in PATH
        args = { "--write-stdout" },
      }
    end,
  },
}
