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
  bg       = get("background", "#090909"),
  fg       = get("foreground", "#F8F8F2"),
  accent   = get("color12", "#3877d1"),
  red      = get("color9", "#E356A7"),
  green    = get("color10", "#42E66C"),
  yellow   = get("color11", "#EFA554"),
  blue     = get("color12", "#9B6BDF"),
  magenta  = get("color13", "#EA517A"),
  cyan     = get("color14", "#61ead9"),
  grey     = get("color7", "#4F5D76"),
  comment  = get("color8", "#5E6C84"),
  highlight= get("color4", "#1d4a88"),

  -- fixed statusline
  status_fg = "#F8F8F2",
  status_bg = "#303136",
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

  -- Syntax
  vim.api.nvim_set_hl(0, "String",   { fg = c.green })
  vim.api.nvim_set_hl(0, "Function", { fg = c.cyan })
  vim.api.nvim_set_hl(0, "Keyword",  { fg = c.blue })
  vim.api.nvim_set_hl(0, "Type",     { fg = c.yellow })
  vim.api.nvim_set_hl(0, "Number",   { fg = c.magenta })
  vim.api.nvim_set_hl(0, "Boolean",  { fg = c.blue })
  vim.api.nvim_set_hl(0, "Error",    { fg = c.red, bold = true })

  -- Git diffs
  vim.api.nvim_set_hl(0, "DiffAdd",    { bg = c.green, fg = c.bg })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = c.red, fg = c.bg })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = c.blue, fg = c.bg })

  -- Statusline (unchanged)
  vim.api.nvim_set_hl(0, "StatusLine",       { fg = c.status_fg, bg = c.status_bg })
  vim.api.nvim_set_hl(0, "StatusLineNC",     { fg = "#b0b0b0",   bg = c.status_bg })
  vim.api.nvim_set_hl(0, "StatusLineTerm",   { fg = c.status_fg, bg = c.status_bg })
  vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = "#b0b0b0",   bg = c.status_bg })
end

theme.setup()

vim.api.nvim_create_user_command("WallustRefresh", function()
  package.loaded["colors.wallustorca"] = nil
  require("colors.wallustorca")
  vim.notify("wallustorca reloaded", vim.log.levels.INFO)
end, {})

return theme
