local M = {}

function M.setup(style)
  local c = {}

  if style == "light" then
    c.bg      = "#F5F5F5"
    c.fg      = "#1E1E1E"
    c.green   = "#007A33"
    c.lgreen  = "#B4D8C1"
    c.dgreen  = "#005026"
    c.gray    = "#CCCCCC"
    c.comment = "#999999"
  end

  return c
end

return M
