return {
  --additional rename support which is really good btw
  {
    "smjonas/inc-rename.nvim",
    lazy = true,
    event = "LspAttach",
    config = function()
      require("inc_rename").setup()
    end,
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        desc = "Incremental Rename",
        expr = true,
      },
    },
  },
}
