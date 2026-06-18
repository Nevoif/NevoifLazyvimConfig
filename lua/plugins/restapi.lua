return {
  {
    "mistweaverco/kulala.nvim",
    lazy = true,
    ft = "http",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>Rr", function() require("kulala").run() end,         desc = "REST: Send Request" },
      { "<leader>Rt", function() require("kulala").toggle_view() end, desc = "REST: Toggle Body/Headers" },
      { "<leader>Rp", function() require("kulala").jump_prev() end,   desc = "REST: Prev Request" },
      { "<leader>Rn", function() require("kulala").jump_next() end,   desc = "REST: Next Request" },
      { "<leader>Rs", function() require("kulala").search() end,      desc = "REST: Search Requests" },
    },
    opts = {
      -- default_view = "body",
      -- debug = false,
    },
  },
}
