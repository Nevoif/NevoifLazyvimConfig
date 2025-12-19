return {
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "angular", "html", "scss" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    keys = {
      {
        "<leader>cy",
        function()
          local fname = vim.api.nvim_buf_get_name(0)
          if fname:match("%.component%.ts$") then
            vim.cmd("e " .. fname:gsub("%.component%.ts$", ".component.html"))
          elseif fname:match("%.component%.html$") then
            vim.cmd("e " .. fname:gsub("%.component%.html$", ".component.ts"))
          end
        end,
        desc = "Angular: Toggle TS/HTML",
      },
    },
  },
}
