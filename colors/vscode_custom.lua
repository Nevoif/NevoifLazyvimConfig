local palette = {
  black        = "#16171A",
  red          = "#E356A7",
  green        = "#42E66C",
  yellow       = "#EFA554",
  blue         = "#9B6BDF",
  magenta      = "#E64747",
  cyan         = "#75D7EC",
  white        = "#B0B0B0",
  bright_black = "#4F5D76",
  bright_red   = "#E356A7",
  bright_green = "#42E66C",
  bright_yellow= "#EFA554",
  bright_blue  = "#9B6BDF",
  bright_magenta= "#E64747",
  bright_cyan  = "#75D7EC",
  bright_white = "#F8F8F2",
}

vim.g.terminal_ansi_colors = {
  palette.black,
  palette.red,
  palette.green,
  palette.yellow,
  palette.blue,
  palette.magenta,
  palette.cyan,
  palette.white,
  palette.bright_black,
  palette.bright_red,
  palette.bright_green,
  palette.bright_yellow,
  palette.bright_blue,
  palette.bright_magenta,
  palette.bright_cyan,
  palette.bright_white,
}

vim.cmd("highlight Normal guibg=" .. palette.black .. " guifg=" .. palette.bright_white)
vim.cmd("highlight Comment guifg=" .. "#5E6C84" .. " gui=italic")
vim.cmd("highlight String guifg=" .. "#FDB8EB")
vim.cmd("highlight Keyword guifg=" .. "#6a96e9")
vim.cmd("highlight Function guifg=" .. "#EA517A")
vim.cmd("highlight Identifier guifg=" .. "#61ead9")
vim.cmd("highlight Constant guifg=" .. "#83F57F")

