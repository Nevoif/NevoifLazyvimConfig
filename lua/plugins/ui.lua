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
        gitsigns = { enabled = false },  -- show git changes in scrollbar
        marks = { enabled = false },
      },
    },
  },

  -- colorizer: show color codes with their actual color more front end thing
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    event = "VeryLazy",
    opts = {
      user_default_options = {
        names = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        mode = "background",
      },
    },
  },

  -- floating filename badges
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function()
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified

          -- Select the highlight group defined in orcatheme.lua
          local hl_group = modified and "InclineModified" or "InclineNormal"

          return {
            { " " },
            { ft_icon, guifg = ft_color }, -- Keep icon color natural
            { " " },
            { filename },
            { " " },
            group = hl_group, -- Apply the theme color here
          }
        end,
      })
    end,
  },
}
