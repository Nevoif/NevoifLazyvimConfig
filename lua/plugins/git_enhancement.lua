-- Enhanced git integration
return {
  -- Lazygit integration
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Diffview for better diff visualization
  {lazy = true,
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git: Diff View" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Git: File History" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Enhanced gitsigns with better visualization
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "▎" },
        changedelete = { text = "▎" },
      },
      signcolumn = true,
      numhl = true,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
    },
    keys = {
      {
        "]h",
        function()
          require("gitsigns").next_hunk()
        end,
        desc = "Gitsigns: Next Hunk",
      },
      {
        "[h",
        function()
          require("gitsigns").prev_hunk()
        end,
        desc = "Gitsigns: Previous Hunk",
      },
      {
        "<leader>hs",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "Gitsigns: Stage Hunk",
      },
      {
        "<leader>hu",
        function()
          require("gitsigns").undo_stage_hunk()
        end,
        desc = "Gitsigns: Undo Stage",
      },
      {
        "<leader>hr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "Gitsigns: Reset Hunk",
      },
      {
        "<leader>hp",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Gitsigns: Preview Hunk",
      },
      {
        "<leader>hd",
        function()
          require("gitsigns").diffthis()
        end,
        desc = "Gitsigns: Diff This",
      },
      {
        "<leader>hb",
        function()
          require("gitsigns").blame_line()
        end,
        desc = "Gitsigns: Blame Line",
      },
    },
  },
}
