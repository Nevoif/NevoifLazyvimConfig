return {
  -- 1. Auto-close tags
  { "windwp/nvim-ts-autotag", opts = {} },

  -- 2. Linters (Added Hadolint)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        html = { "htmlhint" },
        dockerfile = { "hadolint" },
      },
    },
  },

  -- 3. LSP Servers (Added Tailwind)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        tailwindcss = {},
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
        vtsls = {
          settings = {
            typescript = {
              inlayHints = { parameterNames = { enabled = "none" } },
            },
            javascript = {
              inlayHints = { parameterNames = { enabled = "none" } },
            },
          },
        },
      },
    },
  },
}
