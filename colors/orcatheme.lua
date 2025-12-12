local theme = {}

theme.colors = {
  bg = "#090909",
  fg = "#F8F8F2",
  accent = "#3877d1",
  red = "#E356A7",
  green = "#42E66C",
  yellow = "#EFA554",
  blue = "#9B6BDF",
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
  vim.api.nvim_set_hl(0, "Comment", { fg = c.comment })
  vim.api.nvim_set_hl(0, "LineNr", { fg = c.grey })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.accent, bold = true })
  vim.api.nvim_set_hl(0, "Visual", { bg = c.highlight })
  vim.api.nvim_set_hl(0, "Search", { bg = c.highlight, fg = c.fg })

  -- Syntax (Regex Fallbacks)
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

  -- Statusline
  vim.api.nvim_set_hl(0, "StatusLine", { fg = "#F8F8F2", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#b0b0b0", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = "#F8F8F2", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = "#b0b0b0", bg = "#303136" })

  -- =========================================================================
  -- EXTENSIONS
  -- =========================================================================

  -- 1. Pmenu (Autocomplete)
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#121317", fg = "#b0b0b0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1d4a88", fg = "#ffffff", bold = true })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#121317" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = c.accent })

  -- 2. Floating Windows
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#16171a", fg = c.fg })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#16171a", fg = c.accent })

  -- 3. LSP Diagnostics
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF0000" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#CCA700" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#59a4f9" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#8ad0bf" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF0000" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#CCA700" })

  -- 4. Treesitter (Fixed Variables vs Properties)

  -- Variable -> White (Distinguishes from 'var' keyword)
  vim.api.nvim_set_hl(0, "@variable", { fg = c.fg })

  -- Property -> Cyan (Makes 'TemperatureF' colorful again)
  vim.api.nvim_set_hl(0, "@property", { fg = c.cyan })

  -- Parameters -> Pink (Matches VSCode 'summaries' in function calls sometimes, or keep white if preferred)
  vim.api.nvim_set_hl(0, "@parameter", { fg = "#FDB8EB" })

  -- Built-ins
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#6a96e9" }) -- 'this'
  vim.api.nvim_set_hl(0, "@field", { fg = c.fg })
  vim.api.nvim_set_hl(0, "@constructor", { fg = "#EA517A" })
  vim.api.nvim_set_hl(0, "@operator", { fg = "#AE9AFF" })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#89CCEC" })
  vim.api.nvim_set_hl(0, "@namespace", { fg = "#89CCEC" })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = c.fg })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#AE9AFF" })

  -- 5. Plugins
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#303136" })
  vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = c.accent })
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#1d1e22", fg = c.fg })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = "#1d1e22", bg = "#1d1e22" })
end

theme.setup()

return theme
