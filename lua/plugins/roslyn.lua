return {
  {
    "seblyng/roslyn.nvim",
    lazy = true,
    ft = { "cs", "razor" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    -- added direct keymap for code actions (Fix All, Refactor, etc.)
    keys = {
      {
        "<leader>cf",
        function()
          vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
        end,
        desc = "Roslyn Fix/Refactor"
      },
    },
    config = function()
      require("roslyn").setup({
        config = {
          settings = {
            ["csharp|inlay_hints"] = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              csharp_enable_inlay_hints_for_lambda_parameter_types = true,
              dotnet_enable_inlay_hints_for_parameter_names = true,
            },
            ["csharp|code_lens"] = {
              dotnet_enable_references_code_lens = true,
            },
          },
        },
        filewatching = "roslyn",
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Increase timeout for Roslyn LSP operations
      vim.lsp.handlers["$/progress"] = function() end

      vim.filetype.add({
        extension = {
          razor = "razor",
          cshtml = "razor",
        },
      })
    end,
  },
}

-- there is a initiation delay so maybe omnisharp was a better option but incase i need to work on blazor or something i can use this
-- also omnisharp is kinda slow and laggy sometimes
-- also roslyn is more lightweight and faster (they say so)
-- also roslyn has better code completion and refactoring tools
-- also roslyn is more modern and actively maintained
