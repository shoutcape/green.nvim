local M = {}

-- Store the current theme mode globally in the module
M.is_dark = false

function M.load()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Set background based on current mode
  vim.o.background = M.is_dark and "dark" or "light"
  vim.o.termguicolors = true
  vim.g.colors_name = "skaupat"

  -- Use M.is_dark instead of local is_dark
  local c = M.is_dark and dark_palette or light_palette

  -- Skaupat.fi themed color palette (based on actual website)
  local light_palette = {
    -- Base colors
    bg = "#F6F6F6",      -- Pure white (main editor background)
    bg_alt = "#E8F5E8",  -- Very light gray (sidebar, floating windows)
    bg_darker = "#E9ECEF", -- Light gray (line numbers, inactive elements)
    fg = "#212529",      -- Dark charcoal (primary text)
    fg_alt = "#495057",  -- Medium gray (secondary text)
    fg_muted = "#6C757D", -- Muted gray (comments, line numbers)

    -- Skaupat brand colors (from website)
    skaupat_green = "#00B04F", -- Bright green (primary brand)
    skaupat_light = "#E8F5E8", -- Very light green
    skaupat_dark = "#00A046", -- Slightly darker green

    -- Accent colors (inspired by website elements)
    green = "#00B04F",      -- Skaupat green (strings, success)
    dark_green = "#004628", -- Darker green (keywords)
    darkestGreen = "#00aa46", -- darkestGreen (types, info)
    teal = "#20C997",       -- Teal accent (functions)
    yellow = "#FFD43B",     -- Bright yellow (numbers, warnings)
    orange = "#FD7E14",     -- Orange (constants, tags)
    red = "#DC3545",        -- Bootstrap red (errors, deletion)
    pink = "#E83E8C",       -- Pink accent (operators, special chars)
    purple = "#6F42C1",     -- Purple (special keywords)

    -- UI colors
    border = "#DEE2E6",  -- Light gray (borders, dividers)
    selection = "#D4F4DD", -- Light green (text selection)
    search = "#FFF3CD",  -- Light yellow (search highlight)
    match = "#D1ECF1",   -- Light veryDark (matching brackets)

    -- Git colors
    git_add = "#D4F4DD",  -- Light green
    git_change = "#FFF3CD", -- Light yellow
    git_delete = "#F8D7DA", -- Light red
    git_text = "#212529", -- Dark text on git backgrounds

    -- Diagnostic colors
    error = "#DC3545",
    warning = "#FFC107",
    info = "#17A2B8",
    hint = "#28A745",
  }

  local dark_palette = {
    -- Base colors
    bg = "#121212",      -- Deep dark background
    bg_alt = "#1E1E1E",  -- Slightly lighter (sidebars, floats)
    bg_darker = "#2A2A2A", -- For line numbers, folds
    fg = "#F8F9FA",      -- Light text
    fg_alt = "#CED4DA",  -- Secondary light text
    fg_muted = "#868E96", -- Muted gray (comments)

    -- Brand colors (unchanged)
    skaupat_green = "#00B04F",
    skaupat_light = "#1E3525", -- A darkened version of light green
    skaupat_dark = "#00A046",

    -- Accents
    green = "#00B04F",
    dark_green = "#00A046",
    teal = "#20C997",
    yellow = "#FFD43B",
    orange = "#FD7E14",
    red = "#DC3545",
    pink = "#E83E8C",
    purple = "#6F42C1",
    veryDark = "#00aa46",

    -- UI
    border = "#343A40",
    selection = "#1F3C2F",
    search = "#4E4423",
    match = "#2A4A4D",

    -- Git backgrounds
    git_add = "#1F3C2F",
    git_change = "#4E4423",
    git_delete = "#512E31",
    git_text = "#F8F9FA",

    -- Diagnostics
    error = "#DC3545",
    warning = "#FFC107",
    info = "#17A2B8",
    hint = "#28A745",
  }

  local is_dark = false
  local c = is_dark and dark_palette or light_palette
  -- Helper function to set highlights
  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor UI
  hl("Normal", { fg = c.fg, bg = c.bg })
  hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
  hl("NormalNC", { fg = c.fg_alt, bg = c.bg })
  hl("Cursor", { fg = c.bg, bg = c.skaupat_green })
  hl("CursorLine", { bg = c.skaupat_light })
  hl("CursorColumn", { bg = c.skaupat_light })
  hl("ColorColumn", { bg = c.bg_darker })
  hl("LineNr", { fg = c.fg_muted, bg = c.bg_darker })
  hl("CursorLineNr", { fg = c.skaupat_green, bg = c.skaupat_light, bold = true })
  hl("SignColumn", { fg = c.fg_muted, bg = c.bg_darker })
  hl("Folded", { fg = c.fg_muted, bg = c.bg_alt })
  hl("FoldColumn", { fg = c.fg_muted, bg = c.bg_darker })

  -- Selection and search
  hl("Visual", { bg = c.selection })
  hl("VisualNOS", { bg = c.selection })
  hl("Search", { bg = c.search })
  hl("IncSearch", { bg = c.yellow, fg = c.bg })
  hl("CurSearch", { bg = c.orange, fg = c.bg })
  hl("Substitute", { bg = c.orange, fg = c.bg })

  -- Window elements
  hl("StatusLine", { fg = c.bg, bg = c.skaupat_green, bold = true })
  hl("StatusLineNC", { fg = c.fg_muted, bg = c.bg_darker })
  hl("WinSeparator", { fg = c.border })
  hl("VertSplit", { fg = c.border })
  hl("TabLine", { fg = c.fg_muted, bg = c.bg_darker })
  hl("TabLineFill", { bg = c.bg_darker })
  hl("TabLineSel", { fg = c.bg, bg = c.skaupat_green, bold = true })

  -- Menus and popups
  hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
  hl("PmenuSel", { fg = c.bg, bg = c.skaupat_green })
  hl("PmenuSbar", { bg = c.bg_darker })
  hl("PmenuThumb", { bg = c.skaupat_green })
  hl("WildMenu", { fg = c.bg, bg = c.skaupat_green })

  -- Messages
  hl("ErrorMsg", { fg = c.red, bold = true })
  hl("WarningMsg", { fg = c.yellow, bold = true })
  hl("ModeMsg", { fg = c.skaupat_green, bold = true })
  hl("MoreMsg", { fg = c.darkestGreen, bold = true })
  hl("Question", { fg = c.cyan, bold = true })

  -- Syntax highlighting
  hl("Comment", { fg = c.fg_muted, italic = true })
  hl("Constant", { fg = c.orange })
  hl("String", { fg = c.green })
  hl("Character", { fg = c.green })
  hl("Number", { fg = c.yellow })
  hl("Boolean", { fg = c.red, bold = true })
  hl("Float", { fg = c.yellow })

  hl("Identifier", { fg = c.fg })
  hl("Function", { fg = c.cyan, bold = true })

  hl("Statement", { fg = c.purple, bold = true })
  hl("Conditional", { fg = c.purple, bold = true })
  hl("Repeat", { fg = c.purple, bold = true })
  hl("Label", { fg = c.purple })
  hl("Operator", { fg = c.pink })
  hl("Keyword", { fg = c.dark_green, bold = true })
  hl("Exception", { fg = c.red, bold = true })

  hl("PreProc", { fg = c.purple })
  hl("Include", { fg = c.purple })
  hl("Define", { fg = c.purple })
  hl("Macro", { fg = c.purple })
  hl("PreCondit", { fg = c.purple })

  hl("Type", { fg = c.darkestGreen })
  hl("StorageClass", { fg = c.darkestGreen })
  hl("Structure", { fg = c.darkestGreen })
  hl("Typedef", { fg = c.darkestGreen })

  hl("Special", { fg = c.pink })
  hl("SpecialChar", { fg = c.pink })
  hl("Tag", { fg = c.orange })
  hl("Delimiter", { fg = c.fg_alt })
  hl("SpecialComment", { fg = c.fg_muted, italic = true })
  hl("Debug", { fg = c.red })

  -- Diff
  hl("DiffAdd", { bg = c.git_add })
  hl("DiffChange", { bg = c.git_change })
  hl("DiffDelete", { bg = c.git_delete })
  hl("DiffText", { bg = c.git_change, fg = c.git_text, bold = true })

  -- Git signs (for gitsigns.nvim)
  hl("GitSignsAdd", { fg = c.green, bg = c.bg_darker })
  hl("GitSignsChange", { fg = c.yellow, bg = c.bg_darker })
  hl("GitSignsDelete", { fg = c.red, bg = c.bg_darker })

  -- LSP and diagnostics
  hl("DiagnosticError", { fg = c.error })
  hl("DiagnosticWarn", { fg = c.warning })
  hl("DiagnosticInfo", { fg = c.info })
  hl("DiagnosticHint", { fg = c.hint })

  hl("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.warning })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c.info })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = c.hint })

  -- LSP semantic tokens
  hl("@lsp.type.class", { fg = c.cyan })
  hl("@lsp.type.decorator", { fg = c.purple })
  hl("@lsp.type.enum", { fg = c.darkestGreen })
  hl("@lsp.type.function", { fg = c.teal })
  hl("@lsp.type.interface", { fg = c.darkestGreen })
  hl("@lsp.type.macro", { fg = c.purple })
  hl("@lsp.type.method", { fg = c.teal })
  hl("@lsp.type.namespace", { fg = c.purple })
  hl("@lsp.type.parameter", { fg = c.fg })
  hl("@lsp.type.property", { fg = c.fg })
  hl("@lsp.type.struct", { fg = c.darkestGreen })
  hl("@lsp.type.type", { fg = c.darkestGreen })
  hl("@lsp.type.variable", { fg = c.fg })

  -- Tree-sitter
  hl("@comment", { fg = c.fg_muted, italic = true })
  hl("@constant", { fg = c.orange })
  hl("@constant.builtin", { fg = c.orange, bold = true })
  hl("@constant.macro", { fg = c.purple })
  hl("@string", { fg = c.green })
  hl("@string.escape", { fg = c.pink })
  hl("@string.special", { fg = c.pink })
  hl("@character", { fg = c.green })
  hl("@character.special", { fg = c.pink })
  hl("@number", { fg = c.yellow })
  hl("@boolean", { fg = c.red, bold = true })
  hl("@float", { fg = c.yellow })

  hl("@function", { fg = c.teal, bold = true })
  hl("@function.builtin", { fg = c.teal, bold = true })
  hl("@function.macro", { fg = c.purple })
  hl("@method", { fg = c.teal })
  hl("@constructor", { fg = c.darkestGreen })

  hl("@keyword", { fg = c.dark_green, bold = true })
  hl("@keyword.function", { fg = c.purple, bold = true })
  hl("@keyword.operator", { fg = c.purple, bold = true })
  hl("@keyword.return", { fg = c.red, bold = true })

  hl("@operator", { fg = c.pink })
  hl("@punctuation", { fg = c.fg_alt })
  hl("@punctuation.bracket", { fg = c.fg_alt })
  hl("@punctuation.delimiter", { fg = c.fg_alt })

  hl("@variable", { fg = c.fg })
  hl("@variable.builtin", { fg = c.red })
  hl("@variable.parameter", { fg = c.fg })
  hl("@variable.member", { fg = c.fg })

  hl("@type", { fg = c.darkestGreen })
  hl("@type.builtin", { fg = c.darkestGreen })
  hl("@type.definition", { fg = c.darkestGreen })

  hl("@tag", { fg = c.orange })
  hl("@tag.attribute", { fg = c.purple })
  hl("@tag.delimiter", { fg = c.fg_alt })

  -- Telescope (if using telescope.nvim)
  hl("TelescopeBorder", { fg = c.border })
  hl("TelescopeSelectionCaret", { fg = c.skaupat_green })
  hl("TelescopeSelection", { bg = c.skaupat_light })
  hl("TelescopeMatching", { fg = c.skaupat_green, bold = true })

  -- Which-key (if using which-key.nvim)
  hl("WhichKey", { fg = c.skaupat_green, bold = true })
  hl("WhichKeyDesc", { fg = c.fg })
  hl("WhichKeyGroup", { fg = c.darkestGreen })
  hl("WhichKeySeparator", { fg = c.fg_muted })

  -- Indent guides
  hl("IndentBlanklineChar", { fg = c.bg_darker })
  hl("IndentBlanklineContextChar", { fg = c.skaupat_green })

  -- Matching brackets
  hl("MatchParen", { bg = c.match, bold = true })

  -- Spell checking
  hl("SpellBad", { undercurl = true, sp = c.red })
  hl("SpellCap", { undercurl = true, sp = c.yellow })
  hl("SpellLocal", { undercurl = true, sp = c.teal })
  hl("SpellRare", { undercurl = true, sp = c.purple })

  -- Misc
  hl("Directory", { fg = c.veryDark, bold = true })
  hl("Title", { fg = c.skaupat_green, bold = true })
  hl("Bold", { bold = true })
  hl("Italic", { italic = true })
  hl("Underlined", { underline = true })
  hl("Ignore", { fg = c.fg_muted })
  hl("Error", { fg = c.red, bold = true })
  hl("Todo", { fg = c.yellow, bold = true })
  hl("NonText", { fg = c.fg_muted })
  hl("SpecialKey", { fg = c.fg_muted })
end

-- Setup function for easy configuration
function M.setup(opts)
  opts = opts or {}

  -- Allow setting dark mode via options
  if opts.dark ~= nil then
    M.is_dark = opts.dark
  end

  -- Add a toggle function for switching between light and dark
  function M.toggle()
    M.is_dark = not M.is_dark
    M.load()
  end
end

return M
