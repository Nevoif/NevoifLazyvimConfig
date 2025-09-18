return {
  -- other plugins ...
  {
    "nvim-neotest/nvim-nio",
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      -- Optional: dap config can go here or separately
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
}
