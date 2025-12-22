return {
  -- ================================
  -- Angular Support
  -- ================================
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

  -- Auto-close tags for templates
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    ft = { "html", "xml", "jsx", "tsx", "javascript", "typescript", "typescriptreact" },
    opts = {},
  },

  -- Treesitter support for Angular templates
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
  },

  -- Toggle between component .ts and .html
  {
    "neovim/nvim-treesitter",
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
