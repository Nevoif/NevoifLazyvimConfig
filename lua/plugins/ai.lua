return {
  {
    "ThePrimeagen/99",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "saghen/blink.compat", version = "2.*" },
    },
    config = function()
      local ai = require("99")

      ai.setup({
        provider = ai.Providers.CursorAgentProvider,
        model = "auto",
        md_files = { "AGENTS.md" },
        completion = {
          source = "blink",
        },
      })

      vim.keymap.set("n", "<leader>9s", function()
        ai.search()
      end, { desc = "AI: Search project" })
      vim.keymap.set("x", "<leader>9v", function()
        ai.visual()
      end, { desc = "AI: Prompt with selection" })
      vim.keymap.set("n", "<leader>9x", function()
        ai.stop_all_requests()
      end, { desc = "AI: Stop requests" })
    end,
  },
}