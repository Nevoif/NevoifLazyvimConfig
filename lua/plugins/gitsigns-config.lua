return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "]h", function() require("gitsigns").next_hunk() end, desc = "Gitsigns: Next Hunk" },
      { "[h", function() require("gitsigns").prev_hunk() end, desc = "Gitsigns: Previous Hunk" },
      { "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Gitsigns: Stage Hunk" },
      { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Gitsigns: Undo Stage Hunk" },
      { "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Gitsigns: Reset Hunk" },
      { "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Gitsigns: Preview Hunk" },
    },
  },
}
