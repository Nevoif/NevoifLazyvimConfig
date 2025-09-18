return {
  dir = "~/.config/nvim/lua/orcatheme",
  name = "orcatheme",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("orcatheme")
  end,
}
