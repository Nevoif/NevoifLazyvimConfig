return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    cmd = "Neotest",
    dependencies = { "Issafalcon/neotest-dotnet" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-dotnet")({
          dap = { args = { justMyCode = false } },
          discovery_root = "project",
        })
      )
    end,
    keys = {
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Test: Run Nearest",
      },
      {
        "<leader>ts",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Test: Debug Nearest",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Test: Run File",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.fn.getcwd())
        end,
        desc = "Test: Run All",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Test: Toggle Output",
      },
    },
  },
}
