return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    cmd = { "Neotree", "NeoTreeShowToggle" },
    opts = {
      close_if_last_window = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 0,
          with_markers = true,
        },
      },
      window = {
        width = 30,
      },
      filesystem = {
        group_empty_dirs = true,                  -- flattens empty folders (e.g. Services/Auth becomes one line)
        bind_to_cwd = false,
        follow_current_file = { enabled = true }, -- auto-scroll tree to your active file
        use_libuv_file_watcher = true,            -- auto-update tree when files change (git/builds)
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

-- this configures neo-tree to hide massive bin and obj folders that clutter the file explorer, so I only see code.
