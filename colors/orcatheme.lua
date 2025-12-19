local theme = {}

theme.colors = {
  bg = "#090909",
  fg = "#F8F8F2",
  accent = "#61ead9", -- cyan accent
  red = "#E356A7",
  green = "#42E66C",
  yellow = "#EFA554",
  blue = "#9B6BDF",
  lightblue = "#89CCEC",
  magenta = "#EA517A",
  cyan = "#61ead9",
  grey = "#4F5D76", -- slightly brighter blueish grey
  comment = "#728096",
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

  -- Statusline
  vim.api.nvim_set_hl(0, "StatusLine", { fg = "#F8F8F2", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#b0b0b0", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = "#F8F8F2", bg = "#303136" })
  vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = "#b0b0b0", bg = "#303136" })

  -- Extensions
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#121317", fg = "#b0b0b0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = c.lightblue, fg = "#ffffff", bold = true })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#121317" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = c.blue })

  -- <leader>
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#090909", fg = c.fg })
  vim.api.nvim_set_hl(0, "floatBorder", { bg = "#090909", fg = c.accent })

  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF0000" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#CCA700" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = c.accent })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = c.accent })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF0000" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#CCA700" })

  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = c.comment })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = c.comment })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = c.red })


  -- Incline Floating Badges
  -- Saved: Subtle grey background (matches your StatusLine)
  vim.api.nvim_set_hl(0, "InclineNormal", { bg = "#303136", fg = c.fg })
  -- Modified: Yellow background with dark text (High Contrast Warning)
  vim.api.nvim_set_hl(0, "InclineModified", { bg = c.yellow, fg = "#121317", bold = true })

  -- treesitter
  vim.api.nvim_set_hl(0, "@variable", { fg = c.fg })
  vim.api.nvim_set_hl(0, "@property", { fg = c.lightblue })
  vim.api.nvim_set_hl(0, "@field", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@variable.member", { fg = c.cyan })

  vim.api.nvim_set_hl(0, "@parameter", { fg = "#FDB8EB" })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#6a96e9" })
  vim.api.nvim_set_hl(0, "@constructor", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@operator", { fg = "#AE9AFF" })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#89CCEC" })
  vim.api.nvim_set_hl(0, "@namespace", { fg = "#89CCEC" })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = c.fg })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#AE9AFF" })

  -- plugins
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = c.bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = c.bg, bg = c.bg })
  vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = c.accent })
  vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = c.accent })
  vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = c.accent })

  -- rainbow brackets!
  vim.api.nvim_set_hl(0, "MyRainbow1", { fg = "#89CCEC" })
  vim.api.nvim_set_hl(0, "MyRainbow2", { fg = "#6a96e9" })
  vim.api.nvim_set_hl(0, "MyRainbow3", { fg = "#FD88EB" })
  vim.api.nvim_set_hl(0, "MyRainbow4", { fg = "#b190f7" })

  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = c.bg, fg = c.fg })

  local t_bg = "#090909"
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = t_bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = t_bg, fg = c.accent })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = t_bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = t_bg, fg = c.accent })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = c.accent, fg = c.bg })
  vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = t_bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = t_bg, fg = c.accent })
  vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = c.accent, fg = c.bg })
  vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = t_bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = t_bg, fg = c.accent })
  vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = c.accent, fg = c.bg })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#303136", fg = c.accent, bold = true })

  -- Indent-blankline
  vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2f3f", nocombine = true })
  vim.api.nvim_set_hl(0, "IblScope", { fg = "#404854", nocombine = true })
  vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#1a1f2f", nocombine = true })

  -- Deadcolumn (visual guide at 120 chars)
  vim.api.nvim_set_hl(0, "DeadColumn", { fg = "#544a6b" })

  -- Flash (search/navigation)
  vim.api.nvim_set_hl(0, "FlashMatch", { bg = c.highlight, fg = c.accent, bold = true })
  vim.api.nvim_set_hl(0, "FlashLabel", { bg = c.accent, fg = c.bg, bold = true })
  vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#3a3f4f" })
  vim.api.nvim_set_hl(0, "FlashSearch", { bg = c.yellow, fg = c.bg })
  vim.api.nvim_set_hl(0, "FlashPromptIcon", { fg = c.accent })

  -- Barbecue (breadcrumb)
  vim.api.nvim_set_hl(0, "barbecue.normal", { fg = c.fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "barbecue.ellipsis", { fg = c.comment })
  vim.api.nvim_set_hl(0, "barbecue.separator", { fg = c.grey })

  -- Illuminate (word highlight)
  vim.api.nvim_set_hl(0, "IlluminatedWord", { bg = "#1d4a88", bold = false })
  vim.api.nvim_set_hl(0, "IlluminatedCWord", { bg = "#1d4a88", bold = false })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#1d4a88" })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#1d4a88" })
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#1d4a88" })

  -- Treesitter Context (sticky header)
  vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#151a25" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = c.accent, bg = "#151a25" })

  -- Git signs enhancements
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#42E66C" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#E356A7" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#EFA554" })
  vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#42E66C" })
  vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#E356A7" })
  vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#EFA554" })
  vim.api.nvim_set_hl(0, "GitSignsAddInline", { bg = "#1a2d1a" })
  vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { bg = "#2d1a1a" })
  vim.api.nvim_set_hl(0, "GitSignsChangeInline", { bg = "#2d1a1a" })

  -- Hover.nvim
  vim.api.nvim_set_hl(0, "HoverNormal", { fg = c.fg, bg = "#121317" })
  vim.api.nvim_set_hl(0, "HoverBorder", { fg = c.accent, bg = "#121317" })
end

theme.setup()

return theme
