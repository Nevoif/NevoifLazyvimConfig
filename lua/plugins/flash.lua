-- Enhanced search and navigation with visual highlights
return {
  {
    "folke/flash.nvim",
    lazy = true,
    event = "BufRead",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = "c",
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
        exclude = {
          "notify",
          "cmp_menu",
          "noice",
          "flash_prompt",
          function(win)
            return vim.api.nvim_win_get_option(win, "previewwindow")
          end,
        },
      },
      jump = {
        jumplist = true,
        pos = "start",
        history = false,
        register = false,
        nohlsearch = false,
        autojump = false,
      },
      label = {
        uppercase = true,
        before = true,
        after = true,
        reuse = "lowercase",
        distance = true,
        min_pattern_length = 0,
        dynamic = false,
      },
      highlight = {
        backdrop = true,
        matches = true,
        priority = 5000,
        groups = {
          match = "FlashMatch",
          label = "FlashLabel",
          current_match = "",
          backdrop = "FlashBackdrop",
          search = "FlashSearch",
        },
      },
      action = nil,
      pattern = "",
      continue = false,
      config = nil,
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = true,
          highlight = {
            backdrop = false,
          },
          jump = {
            register = false,
          },
        },
      },
      prompt = {
        prefix = { { "⚡", "FlashPromptIcon" } },
      },
      remote_op = {
        restore = false,
        motion = false,
      },
    },
  },
}
