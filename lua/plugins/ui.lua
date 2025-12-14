return {
  --rainbow yeey
  {
    "HiPhish/rainbow-delimiters.nvim",
    opts = {
      highlight = {
        "MyRainbow1",
        "MyRainbow2",
        "MyRainbow3",
        "MyRainbow4",
      },
    },
    config = function(_, opts)
      vim.g.rainbow_delimiters = opts
    end,
  },

  -- modicator: change line number color based on mode which is cute
  {
    "mawkler/modicator.nvim",
    opts = {
      show_warnings = false, -- clean output
    },
  },

  -- satellite: scrollbar with diagnostics git and warning stuff
  {
    "lewis6991/satellite.nvim",
    opts = {
      current_only = true, -- only show on active window
      winblend = 10,       -- transparency
      handlers = {
        cursor = { enabled = true },
        search = { enabled = true },     -- show search results in scrollbar
        diagnostic = { enabled = true }, -- show errors in scrollbar
        gitsigns = { enabled = true },   -- show git changes in scrollbar
        marks = { enabled = false },
      },
    },
  },

  -- colorizer: show color codes with their actual color more front end thing
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        mode = "background",
      },
    },
  },

}
