local theme = {}


theme.colors = {
  bg = "#090909",
  fg = "#F8F8F2",
  accent = "#3877d1",
  red = "#E356A7",
  green = "#42E66C",
  yellow = "#EFA554",
  blue = "#9B6BDF",
  lightblue = "#89CCEC",
  magenta = "#EA517A",
  cyan = "#61ead9",
  grey = "#4F5D76",
  comment = "#5E6C84",
  highlight = "#1d4a88",
}

function theme.setup()
  local c = theme.colors
  vim.cmd("hi clear")
  vim.o.background = "dark"
  vim.g.colors_name = "orcatheme"

  -- Core UI
  vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "Comment", { fg = c.comment, italic = true })
  vim.api.nvim_set_hl(0, "LineNr", { fg = c.grey })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.accent, bold = true })
  vim.api.nvim_set_hl(0, "Visual", { bg = c.highlight })
  vim.api.nvim_set_hl(0, "Search", { bg = c.highlight, fg = c.fg })

  -- Syntax
  vim.api.nvim_set_hl(0, "String", { fg = "#FDB8EB" })
  vim.api.nvim_set_hl(0, "Function", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#6a96e9" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#89CCEC" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#83F57F" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#6a96e9" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#ff0000", bold = true })

  -- Git
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#132D14" })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#2A2929" })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#0E2539" })

  -- Statusline colors
  vim.api.nvim_set_hl(0, "StatusLine", { fg = "#F8F8F2", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#b0b0b0", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = "#F8F8F2", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = "#b0b0b0", bg = "#303136" })
end

theme.setup()

return theme
