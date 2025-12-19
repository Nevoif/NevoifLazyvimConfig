return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  event = "InsertEnter",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })

    local ls = require("luasnip")

    -- keybindings for snippet navigation
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-h>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vim.keymap.set("i", "<C-u>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)

    -- make sure snippets are cleaned up on detach
    vim.api.nvim_create_autocmd("User", {
      pattern = "LuasnipCleanup",
      callback = function()
        if vim.api.nvim_buf_is_valid(0) then
          ls.exit_snippet()
        end
      end,
    })
  end,
}
