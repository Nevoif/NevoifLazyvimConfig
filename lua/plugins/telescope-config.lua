return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope: Find Files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope: Live Grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope: List Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope: Help Tags" },
      { "<leader>gs", function() require("telescope.builtin").git_status() end, desc = "Git: Status" },
    },
  },
}
