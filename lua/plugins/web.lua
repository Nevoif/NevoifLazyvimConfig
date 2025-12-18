return {
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "emmet-language-server", -- Emmet
        "stylelint", -- CSS Linter
        "htmlhint",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Simple Web Servers
        html = {},
        cssls = {},

        -- Emmet
        emmet_language_server = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
          },
        },

        -- TypeScript / JavaScript (VTSLS)
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "none" }, -- DISABLES "elementId"
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "none" }, -- DISABLES "elementId"
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
}
