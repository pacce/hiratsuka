local theme = require('hiratsuka.theme')

local function setup(config)
    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    vim.o.termguicolors = true
    vim.g.colors_name   = 'hiratsuka'

    local black     = {
          dark      = '#000000'
        , light     = '#262626'
        , lighter   = '#4E4E4E'
    }
    local white     = '#FFFFFF'
    local gray      = {
          medium    = '#767676'
        , light     = '#A8A8A8'
        , lighter   = '#C6C6C6'
        , lightest  = '#EEEEEE'
    }
    local orange    = '#FF8700'
    local accent    = orange
    local base      = {
          Normal            = {}
        , Visual            = { fg = white, bg = accent }
        , Cursor            = {}
        , MatchParen        = { fg = white, bg = accent, style = 'bold' }

        , Comment           = { fg = gray.light, style = 'italic' }
        , Statement         = { fg = gray.medium }
        , Constant          = { fg = accent }
        , Operator          = { fg = gray.medium, style = 'bold' }
        , PreProc           = { fg = gray.medium }
        , Type              = { fg = gray.medium }
        , Special           = { fg = gray.medium, style = 'italic' }

        , Underlined        = { style = 'underline' }
        , Ignore            = {}
        , Error             = { fg = accent }
        , Todo              = { fg = black.medium, bg = white, style = 'bold' }
        , Directory         = { fg = accent }

        , Search            = { fg = white, bg = accent }

        , LineNr            = { fg = gray.lighter }
        , SignColumn        = { bg = white }
        , SignColumnSB      = { bg = white }
        , EndOfBuffer       = { fg = gray.lighter }

        , Pmenu             = { bg =      white, fg = black.dark, style = 'bold' }
        , PmenuSel          = { bg = black.dark, fg =      white, style = 'bold' }
        , PmenuSbar         = { bg =     accent, fg =      white }
        , NormalFloat       = { fg = gray.light }

        , DiagnosticDefaultError    = { fg = accent }
        , DiagnosticDefaultWarn     = { fg = accent }
        , DiagnosticDefaultInfo     = { fg = accent }
        , DiagnosticDefaultHint     = { fg = accent }

        , DiagnosticSignError    = { fg = accent }
        , DiagnosticSignWarn     = { fg = accent }
        , DiagnosticSignInfo     = { fg = accent }
        , DiagnosticSignHint     = { fg = accent }

        , DiagnosticUnderlineError    = { fg = accent, style = 'underline' }
        , DiagnosticUnderlineWarn     = { fg = accent, style = 'underline' }
        , DiagnosticUnderlineInfo     = { fg = accent, style = 'underline' }
        , DiagnosticUnderlineHint     = { fg = accent, style = 'underline' }

        , DiagnosticVirtualTextError    = { fg = gray.lighter }
        , DiagnosticVirtualTextWarn     = { fg = gray.lighter }
        , DiagnosticVirtualTextInfo     = { fg = gray.lighter }
        , DiagnosticVirtualTextHint     = { fg = gray.lighter }
    }
    local link      = {
            Character       = 'Constant'    -- a char constant      : 'c'
          , Number          = 'Constant'    -- a number constant    : 0xFF
          , Boolean         = 'Constant'    -- a boolean constant   : TRUE
          , Float           = 'Constant'    -- a float constant     : 2.3e10
          , String          = 'Constant'    -- a string constant    : "this is a string"

          , Conditional     = 'Statement'
          , Repeat          = 'Statement'
          , Label           = 'Statement'
          , Keyword         = 'Statement'
          , Exception       = 'Statement'
          , Include         = 'PreProc'
          , Define          = 'PreProc'
          , Macro           = 'PreProc'
          , PreCondit       = 'PreProc'
          , StorageClass    = 'Type'    -- static, register, volatile
          , Structure       = 'Type'    -- struct, union, enum
          , Typedef         = 'Type'    -- typedef

          , SpecialChar     = 'Special'
          , Tag             = 'Special'
          , Delimiter       = 'Special'
          , SpecialComment  = 'Special'
          , Debug           = 'Special'

          , IncSearch       = 'Search'
          , Substitute      = 'Search'

          , ErrorMsg        = 'Error'
    }

    for key, value in pairs(base) do
        local foreground    = value.fg or black.dark
        local background    = value.bg or white
        local style         = value.style or 'NONE'
        local highlight     = string.format('highlight %s gui=%s guifg=%s guibg=%s'
            , key
            , style
            , foreground
            , background
            )

        vim.cmd(highlight)
    end

    for key, value in pairs(link) do
        local highlight     = string.format('highlight! link %s %s', key, value)
        vim.cmd(highlight)
    end
end

return { setup = setup }
