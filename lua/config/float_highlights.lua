-- Centralized floating UI styling configuration
-- This file manages all floating window colors for easier maintenance and theme switching
-- Reference this when adding new floating UI elements or changing themes

local M = {}

-- Core floating window colors (used by most plugins and native UI)
M.colors = {
  -- Main floating window background - slightly brighter than main editor bg
  floating_bg = "#121620",
  
  -- Border color - uses accent color for visibility
  border_fg = "#61ead9", -- cyan accent
  
  -- Text colors
  normal_fg = "#F8F8F2",
  comment_fg = "#728096",
  
  -- Editor background for reference
  editor_bg = "#090909",
  
  -- Highlight backgrounds
  highlight_bg = "#1d4a88",
  subtle_bg = "#151a25",
}

-- Highlight groups that should be checked when changing themes
M.float_groups = {
  "NormalFloat",
  "FloatBorder",
  "Pmenu",
  "PmenuSel",
  "PmenuSbar",
  "PmenuThumb",
  "NeoTreeFloatBorder",
  "NeoTreeFloatTitle",
  "AvanteTitle",
  "AvanteNormal",
  "AvanteBorder",
  "NoiceCmdlinePopupBorder",
  "NoiceCmdlinePopup",
  "NoicePopupBorder",
  "DressingInputNormal",
  "DressingInputBorder",
  "DressingSelectNormal",
  "DressingSelectBorder",
  "TroubleNormal",
  "TroubleBorder",
  "HoverNormal",
  "HoverBorder",
}

-- Guidelines for maintaining consistency
M.guidelines = {
  contrast = "Ensure 4.5:1 minimum contrast ratio for text on floating_bg",
  consistency = "All floating windows should use floating_bg for background",
  borders = "Use border_fg (accent color) for all float borders",
  visibility = "Floating windows must be visibly distinct from editor background",
}

return M
