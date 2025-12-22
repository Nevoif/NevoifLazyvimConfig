return {
  -- ================================
  -- Web Development Support
  -- ================================

  -- Auto-close tags in HTML/Vue/JSX
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml", "jsx", "tsx", "javascript", "typescript", "typescriptreact", "vue" },
    opts = {},
  },

  -- Linters for web
  {
    "mfussenegger/nvim-lint",
    ft = { "html", "css", "javascript", "typescript", "json", "jsonc" },
    opts = {
      linters_by_ft = {
        html = { "htmlhint" },
        dockerfile = { "hadolint" },
      },
    },
  },

  -- LSP servers for web development
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
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
}
