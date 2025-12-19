return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      opts.formatters_by_ft.cs = { "csharpier" }

      opts.formatters_by_ft.javascript = { "prettier" }
      opts.formatters_by_ft.typescript = { "prettier" }
      opts.formatters_by_ft.javascriptreact = { "prettier" }
      opts.formatters_by_ft.typescriptreact = { "prettier" }
      opts.formatters_by_ft.css = { "prettier" }
      opts.formatters_by_ft.html = { "prettier" }
      opts.formatters_by_ft.json = { "prettier" }
      opts.formatters_by_ft.markdown = { "prettier" }

      opts.formatters_by_ft.scss = { "prettier" }
      opts.formatters_by_ft["angular.html"] = { "prettier" }

      opts.formatters_by_ft.lua = { "stylua" }
      opts.formatters_by_ft.sh = { "shfmt" }
      opts.formatters_by_ft.python = { "black" }

      opts.formatters = opts.formatters or {}
      opts.formatters.csharpier = {
        command = "dotnet-csharpier",
        args = { "--write-stdout" },
      }
    end,
  },
}
