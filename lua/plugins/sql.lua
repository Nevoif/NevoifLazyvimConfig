return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    -- Added: The run button
    keys = {
      {
        "<leader>r",
        "<cmd>DB<cr>",
        desc = "Run SQL Query",
        ft = { "sql", "mysql", "plsql" },
      },
    },
  },
}
