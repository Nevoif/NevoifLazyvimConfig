return {
  "nvim-mini/mini.surround",
  version = false,
  keys = function()
    return {
      { "<leader>ms", desc = "Surround" },
      { "<leader>msw", desc = "Surround word" },
      { "<leader>ms", mode = "v", desc = "Surround selection" },
    }
  end,
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "<leader>msa",     -- add surround (e.g., "word" -> add 's around it)
        delete = "<leader>msd",   -- delete surround
        find = "<leader>msf",     -- find surround
        find_left = "<leader>msF", -- find surround (left)
        highlight = "<leader>msh", -- highlight surround
        replace = "<leader>msr",   -- replace surround
        update_n_lines = "<leader>msn", -- update number of lines
      },
      n_lines = 20,
      search_method = "cover",
      silent = false,
    })
  end,
}
