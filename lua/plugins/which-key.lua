return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    show_help = true,
    triggers = { "<leader>" },
    win = {
      border = "rounded",
      zindex = 1000,
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- define all keybinding groups and individual keybindings
    wk.add({
      -- Groups
      { "<leader>d", group = "debug" },
      { "<leader>t", group = "test" },
      { "<leader>f", group = "find" },
      { "<leader>x", group = "diagnostics" },
      { "<leader>c", group = "code" },
      { "<leader>h", group = "harpoon" },
      { "<leader>g", group = "git" },
      { "<leader>s", group = "sql" },
      { "<leader>R", group = "rest" },
      { "<leader>q", group = "session" },
      { "<leader>m", group = "surround" },

      -- Debug keybindings
      { "<leader>db", desc = "Toggle Breakpoint" },
      { "<leader>dc", desc = "Continue" },
      { "<leader>do", desc = "Step Over" },
      { "<leader>di", desc = "Step Into" },
      { "<leader>du", desc = "Step Out" },
      { "<leader>dy", desc = "Toggle DAP UI" },
      { "<leader>dm", desc = "Toggle REPL" },
      { "<leader>dh", desc = "Hover Variables" },
      { "<leader>df", desc = "Floating Inspector" },
      { "<leader>de", desc = "Evaluate Expression" },
      { "<leader>dp", desc = "Pause" },
      { "<leader>dq", desc = "Disconnect" },
      { "<leader>dl", desc = "Run Last" },
      { "<leader>dx", desc = "Exception Breakpoints" },

      -- Test keybindings
      { "<leader>tn", desc = "Run Test at Cursor" },
      { "<leader>ts", desc = "Debug Test at Cursor" },
      { "<leader>tf", desc = "Run All Tests in File" },
      { "<leader>ta", desc = "Run All Tests" },
      { "<leader>to", desc = "Toggle Test Output" },

      -- Find keybindings
      { "<leader>ff", desc = "Find Files" },
      { "<leader>fg", desc = "Live Grep" },
      { "<leader>fb", desc = "List Buffers" },
      { "<leader>fh", desc = "Help Tags" },

      -- Diagnostics keybindings
      { "<leader>xx", desc = "Toggle Diagnostics" },
      { "<leader>xw", desc = "Workspace Diagnostics" },
      { "<leader>xl", desc = "Location List" },
      { "<leader>xq", desc = "Quickfix List" },
      { "<leader>xt", desc = "Todo Comments" },

      -- Code keybindings
      { "<leader>cf", desc = "Code Actions" },
      { "<leader>cy", desc = "Angular: Toggle TS/HTML" },
      { "<leader>ce", desc = "Code Structure" },

      -- Harpoon keybindings
      { "<leader>ha", desc = "Add File" },
      { "<leader>hh", desc = "Harpoon Menu" },
      { "<leader>1", desc = "Harpoon 1" },
      { "<leader>2", desc = "Harpoon 2" },
      { "<leader>3", desc = "Harpoon 3" },
      { "<leader>4", desc = "Harpoon 4" },

      -- Git keybindings
      { "<leader>gs", desc = "Git Status" },
      { "<leader>hs", desc = "Stage Hunk" },
      { "<leader>hu", desc = "Undo Stage Hunk" },
      { "<leader>hr", desc = "Reset Hunk" },
      { "<leader>hp", desc = "Preview Hunk" },

      -- SQL keybindings
      { "<leader>sd", desc = "Toggle DB UI" },
      { "<leader>r", desc = "Run Query" },

      -- REST keybindings
      { "<leader>Rr", desc = "Send Request" },
      { "<leader>Rt", desc = "Toggle Body/Headers" },
      { "<leader>Rp", desc = "Previous Request" },
      { "<leader>Rn", desc = "Next Request" },
      { "<leader>Rs", desc = "Search Requests" },

      -- Session keybindings
      { "<leader>qs", desc = "Restore Session" },
      { "<leader>qS", desc = "Select Session" },
      { "<leader>ql", desc = "Restore Last Session" },

      -- Surround keybindings
      { "<leader>msa", desc = "Add Surround" },
      { "<leader>msd", desc = "Delete Surround" },
      { "<leader>msr", desc = "Replace Surround" },
      { "<leader>msf", desc = "Find Surround" },
      { "<leader>msh", desc = "Highlight Surround" },

      -- Build & Run keybindings
      { "<leader>B", desc = "Build Solution" },
      { "<leader>dr", desc = "Run Project" },
      { "<leader>ds", desc = "Manage User Secrets" },

      -- Other keybindings
      { "<leader>rn", desc = "Rename Symbol" },
      { "<leader>`", desc = "Toggle Terminal" },
      { "<leader>x", desc = "Delete Buffer" },
    })
  end,
}
