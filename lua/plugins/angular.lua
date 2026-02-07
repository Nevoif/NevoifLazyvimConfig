return {
  {
    "neovim/nvim-lspconfig",
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    opts = {
      servers = {
        angularls = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("angular.json")(fname)
          end,
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "angular",
          "html",
          "scss",
          "typescript",
        })
      end
    end,
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
        desc = "Angular: Toggle Component TS/HTML",
      },
    },
  },
}
