return {
  -- 1. LSP: Angular Language Server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {},
        -- Ensure HTML/CSS/Emmet are also active for templates
        html = {},
        cssls = {},
        emmet_language_server = {
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "angular" },
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "angular",
          "html",
          "scss",
          "typescript",
        })
      end
    end,
  },
}
