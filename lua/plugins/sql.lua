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
    keys = {
      {
        "<leader>sd",
        "<cmd>DBUIToggle<cr>",
        desc = "SQL: Toggle DB UI",
      },
      {
        "<leader>r",
        "<cmd>DB<cr>",
        desc = "SQL: Run Query",
        ft = { "sql", "mysql", "plsql" },
      },
    },
  },
}
