return {
  "folke/persistence.nvim",
  lazy = true,
  event = "BufReadPre",
  cmd = { "RestoreSession", "SaveSession" },
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
    options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used when saving
    pre_save = nil, -- function to call before saving the session
    save_empty = false, -- don't save if there are no open file buffers
  },
  keys = {
    {
      "<leader>qs",
      function()
        require("persistence").load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>qS",
      function()
        require("persistence").select()
      end,
      desc = "Select Session",
    },
    {
      "<leader>ql",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Restore Last Session",
    },
  },
}
