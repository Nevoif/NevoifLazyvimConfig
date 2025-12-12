return {
  {
    "nvim-neotest/neotest",
    dependencies = { "Issafalcon/neotest-dotnet" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require("neotest-dotnet")({
        dap = { args = { justMyCode = false } },
        discovery_root = "project",
      }))
    end,
    -- Added: Your custom keymaps
    keys = {
      {
        "<leader>tn",
        function() require("neotest").run.run() end,
        desc = "Neotest: Run nearest test"
      },
      {
        "<leader>ts",
        function() require("neotest").run.run({ strategy = "dap" }) end,
        desc = "Neotest: Debug nearest test"
      },
      {
        "<leader>tf",
        function() require("neotest").run.run(vim.fn.expand("%")) end,
        desc = "Neotest: Run tests in file"
      },
      -- Optional: Output panel toggle
      {
        "<leader>to",
        function() require("neotest").output_panel.toggle() end,
        desc = "Neotest: Toggle Output Panel"
      },
    },
  },
}
