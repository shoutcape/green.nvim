local M = {}

function M.setup(style)
  local c = {}

  -- Base background and foreground
  c.bg         = "#ffffff"  -- or #f5f5f5
  c.bg_alt     = "#f6f6f6"
  c.bg_highlight = "#ebf7ec"

  c.fg         = "#1f1f1f"
  c.fg_alt     = "#484848"
  c.comment    = "#949494"

  -- Accents
  c.blue       = "#3974bc"
  c.green      = "#007841"
  c.teal       = "#006e87"
  c.brown      = "#885600"
  c.red        = "#b70000"
  c.yellow     = "#fff781"
  c.error_bg   = "#ffeded"

  -- UI and special
  c.selection  = "#e4f5e8"
  c.cursorline = "#f1f1f1"
  c.statusline = "#007841"
  c.visual     = "#d2fcd5"
  c.diff_add   = "#ebf7ec"
  c.diff_delete = "#ffeded"

  return c
end

return M
