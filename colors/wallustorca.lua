local theme = {}

-- path to your wallust colors file
local css_path = vim.fn.expand("~/.config/waybar/wallust/colors-waybar.css")

-- read css colors
local colors = {}
local f = io.open(css_path, "r")
if f then
  for line in f:lines() do
    local name, hex = line:match("@define%-color%s+(%S+)%s+(#%x%x%x%x%x%x)")
    if name and hex then
      colors[name] = hex
    end
  end
  f:close()
else
  vim.notify("wallustorca: couldn't read colors-waybar.css", vim.log.levels.WARN)
end

-- fallback if wallust isn't loaded yet
local function get(name, fallback)
  return colors[name] or fallback
end

theme.colors = {
  bg        = get("background", "#090909"),
  fg        = get("foreground", "#F8F8F2"),
  accent    = get("color12", "#3877d1"),
  red       = get("color9", "#E356A7"),
  green     = get("color10", "#42E66C"),
  yellow    = get("color11", "#EFA554"),
  blue      = get("color12", "#9B6BDF"),
  magenta   = get("color13", "#EA517A"),
  cyan      = get("color14", "#61ead9"),
  grey      = get("color7", "#4F5D76"),
  comment   = get("color8", "#5E6C84"),
  highlight = get("color4", "#1d4a88"),

  -- extra derived colors
  dark_bg   = get("color0", "#121317"), -- usually darker than bg
  light_bg  = get("color8", "#303136"), -- slightly lighter
}

function theme.setup()
  local c = theme.colors
  vim.cmd("hi clear")
  vim.o.background = "dark"
  vim.g.colors_name = "wallustorca"

  -- Core UI
  vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "Comment", { fg = c.comment, italic = true })
  vim.api.nvim_set_hl(0, "LineNr", { fg = c.grey })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.accent, bold = true })
  vim.api.nvim_set_hl(0, "Visual", { bg = c.highlight })
  vim.api.nvim_set_hl(0, "Search", { bg = c.highlight, fg = c.fg })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.grey, bg = c.bg })

  -- Syntax
  vim.api.nvim_set_hl(0, "String", { fg = c.green })
  vim.api.nvim_set_hl(0, "Function", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "Keyword", { fg = c.blue })
  vim.api.nvim_set_hl(0, "Type", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "Number", { fg = c.magenta })
  vim.api.nvim_set_hl(0, "Boolean", { fg = c.blue })
  vim.api.nvim_set_hl(0, "Error", { fg = c.red, bold = true })
  vim.api.nvim_set_hl(0, "Operator", { fg = c.fg })

  -- Git diffs
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = c.green, fg = c.bg })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = c.red, fg = c.bg })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = c.blue, fg = c.bg })

  -- Statusline
  vim.api.nvim_set_hl(0, "StatusLine", { fg = c.fg, bg = c.light_bg })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = c.comment, bg = c.light_bg })
  vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = c.fg, bg = c.light_bg })
  vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = c.comment, bg = c.light_bg })

  -- Pmenu (Completion)
  vim.api.nvim_set_hl(0, "Pmenu", { bg = c.dark_bg, fg = c.comment })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = c.highlight, fg = c.fg, bold = true })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = c.dark_bg })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = c.accent })

  -- Floating Windows
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = c.bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = c.bg, fg = c.accent })

  -- Diagnostics
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = c.red })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = c.accent })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })

  -- Treesitter
  vim.api.nvim_set_hl(0, "@variable", { fg = c.fg })
  vim.api.nvim_set_hl(0, "@property", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@field", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@parameter", { fg = c.magenta })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = c.blue })
  vim.api.nvim_set_hl(0, "@constructor", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@operator", { fg = c.fg })
  vim.api.nvim_set_hl(0, "@keyword", { fg = c.blue })
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "@type.builtin", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = c.grey })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = c.grey })

  -- Plugins: NeoTree
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = c.bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = c.bg, bg = c.bg })
  vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = c.green })

  -- Plugins: Telescope
  local t_bg = c.bg
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = t_bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = t_bg, fg = c.accent })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = t_bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = t_bg, fg = c.accent })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = c.accent, fg = c.bg })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = c.light_bg, fg = c.accent, bold = true })

  -- Indent-blankline
  vim.api.nvim_set_hl(0, "IblIndent", { fg = c.dark_bg, nocombine = true })
  vim.api.nvim_set_hl(0, "IblScope", { fg = c.light_bg, nocombine = true })
  vim.api.nvim_set_hl(0, "IblWhitespace", { fg = c.dark_bg, nocombine = true })

  -- Deadcolumn (visual guide at 120 chars)
  vim.api.nvim_set_hl(0, "DeadColumn", { fg = c.grey })

  -- Flash (search/navigation)
  vim.api.nvim_set_hl(0, "FlashMatch", { bg = c.highlight, fg = c.accent, bold = true })
  vim.api.nvim_set_hl(0, "FlashLabel", { bg = c.accent, fg = c.bg, bold = true })
  vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = c.comment })
  vim.api.nvim_set_hl(0, "FlashSearch", { bg = c.yellow, fg = c.bg })
  vim.api.nvim_set_hl(0, "FlashPromptIcon", { fg = c.accent })

  -- Barbecue (breadcrumb)
  vim.api.nvim_set_hl(0, "barbecue.normal", { fg = c.fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "barbecue.ellipsis", { fg = c.comment })
  vim.api.nvim_set_hl(0, "barbecue.separator", { fg = c.grey })

  -- Illuminate (word highlight)
  vim.api.nvim_set_hl(0, "IlluminatedWord", { bg = c.highlight, bold = false })
  vim.api.nvim_set_hl(0, "IlluminatedCWord", { bg = c.highlight, bold = false })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = c.highlight })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = c.highlight })
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = c.highlight })

  -- Treesitter Context (sticky header)
  vim.api.nvim_set_hl(0, "TreesitterContext", { bg = c.dark_bg })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = c.accent, bg = c.dark_bg })

  -- Git signs enhancements
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = c.green })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = c.red })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = c.green })
  vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = c.red })
  vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = c.yellow })
  vim.api.nvim_set_hl(0, "GitSignsAddInline", { bg = c.dark_bg })
  vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { bg = c.dark_bg })
  vim.api.nvim_set_hl(0, "GitSignsChangeInline", { bg = c.dark_bg })

  -- Hover.nvim
  vim.api.nvim_set_hl(0, "HoverNormal", { fg = c.fg, bg = c.dark_bg })
  vim.api.nvim_set_hl(0, "HoverBorder", { fg = c.accent, bg = c.dark_bg })

  -- Incline Floating Badges
  vim.api.nvim_set_hl(0, "InclineNormal", { bg = c.light_bg, fg = c.fg })
  vim.api.nvim_set_hl(0, "InclineModified", { bg = c.yellow, fg = c.bg, bold = true })
end

theme.setup()

vim.api.nvim_create_user_command("WallustRefresh", function()
  package.loaded["colors.wallustorca"] = nil
  require("colors.wallustorca")
  vim.notify("wallustorca reloaded", vim.log.levels.INFO)
end, {})

return theme
