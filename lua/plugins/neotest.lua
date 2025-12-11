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
  },
}
