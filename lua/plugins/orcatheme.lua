return {
  {
    dir = vim.fn.expand("~/.config/nvim/colors"),
    name = "orcatheme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("orcatheme")
    end,
  },
}
