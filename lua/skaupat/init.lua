local M = {}

function M.load(style)
  style = style or "light" -- in case you support light/dark

  local colors = require("skaupat.colors").setup(style)
  local set_hl = vim.api.nvim_set_hl

  -- Basic highlights
  set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
  set_hl(0, "Comment", { fg = colors.comment, italic = true })
  set_hl(0, "Keyword", { fg = colors.green, bold = true })
  set_hl(0, "String", { fg = colors.dgreen })
  set_hl(0, "Function", { fg = colors.green })
  set_hl(0, "Identifier", { fg = colors.fg })

  -- UI elements
  set_hl(0, "LineNr", { fg = colors.gray })
  set_hl(0, "CursorLine", { bg = colors.lgreen })
  set_hl(0, "StatusLine", { fg = colors.bg, bg = colors.green, bold = true })

  -- Extend more groups, lualine, telescope, etc. here

end

return M
