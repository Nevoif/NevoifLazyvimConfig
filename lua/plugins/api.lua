return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<leader>R",  "",                                             desc = "+Rest" },
      { "<leader>Rr", function() require("kulala").run() end,         desc = "Send Request" },
      { "<leader>Rt", function() require("kulala").toggle_view() end, desc = "Toggle Headers/Body" },
      { "<leader>Rp", function() require("kulala").jump_prev() end,   desc = "Prev Request" },
      { "<leader>Rn", function() require("kulala").jump_next() end,   desc = "Next Request" },
    },
    opts = {
      -- default_view = "body",
      -- debug = false,
    },
  },
}

--to test ASP.NET Core APIs directly inside Neovim without context switching
