-- Enhanced floating window styling and UI
return {
  -- Better Noice configuration with enhanced styling
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = true,
          silent = false,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
        },
        message = {
          enabled = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " 🔍 ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " 🔍 ", lang = "regex" },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      views = {
        cmdline_popup = {
          backend = "popup",
          relative = "editor",
          zindex = 200,
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        popupmenu = {
          backend = "popupmenu",
          relative = "editor",
          position = {
            row = 8,
            col = 0,
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            line = "─",
            left = "│",
            right = "│",
            top = "┌",
            top_left = "┌",
            top_right = "┐",
            bottom = "└",
            bottom_left = "└",
            bottom_right = "┘",
          },
          win_options = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
          },
        },
      },
    },
  },

  -- Hover documentation enhancement
  {
    "lewis6991/hover.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("hover").setup({
        init = function()
          require("hover.providers.lsp")
          require("hover.providers.bash")
          require("hover.providers.dap")
        end,
        preview_opts = {
          border = "rounded",
        },
        preview_window = false,
        title = true,
        mouse_providers = {
          "LSP",
        },
        mouse_delay = 1000,
      })
    end,
    keys = {
      {
        "K",
        function()
          require("hover").hover()
        end,
        desc = "Hover",
      },
      {
        "gK",
        function()
          require("hover").hover_select()
        end,
        desc = "Hover Select",
      },
    },
  },
}
