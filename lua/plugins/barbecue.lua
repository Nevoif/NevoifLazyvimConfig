-- VSCode-style breadcrumb navigation
return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    lazy = true,
    event = "BufRead",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      create_autocmd = true,
      attach_navic = true,
      theme = "auto",
      show_modified = false,
      lead_custom_section = function()
        return " "
      end,
      custom_section = function()
        return " "
      end,
      context_follow_cursor = false,
      exclude_filetypes = { "toggleterm", "prompt", "TelescopePrompt", "neo-tree", "lazy" },
      modifiers = {
        dirname = ":.:h",
        basename = "",
      },
      show_dirname = true,
      show_basename = true,
    },
  },
}
