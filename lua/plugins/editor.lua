return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "bin",
            "obj",
          },
          hide_by_pattern = {
            "*.meta",
          },
        },
      },
    },
  },
}

-- This configures Neo-tree to hide massive bin and obj folders that clutter the file explorer, so I only see code.
