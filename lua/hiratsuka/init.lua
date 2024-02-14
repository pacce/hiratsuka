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
    local base      = { 
          Normal        = {}
        , Cursor        = {}
        , Comment       = { fg = gray.light, style = 'italic' }
        , Statement     = { fg = gray.medium }
        , Constant      = { fg = orange }
        , Operator      = { fg = gray.medium, style = 'bold' }
        , PreProc       = { fg = gray.medium }
        , Type          = { fg = gray.medium }
        , Special       = { fg = gray.medium, style = 'italic' }
        , Underlined    = { style = 'underline' }
        , Ignore        = {}
        , Error         = { fg = orange }
        , Todo          = { fg = black.medium, bg = white, style = 'bold' }
        -- SpecialKey
        -- NonText
        , Directory     = { fg = orange }
        -- ErrorMsg
        -- IncSearch
        -- Search
        -- MoreMsg
        -- , LineNr        = { fg = orange }
        -- , CursorLineNr  = { fg = orange, bg = gray.lightest }
        , Pmenu         = { bg = white, fg = gray.medium }
        , PmenuSel      = { bg = orange, fg = white }
        -- , PmenuKind      = { bg = orange, fg = white }
        -- , PmenuKindSel   = { bg = orange, fg = white }
        -- , PmenuExtra     = { bg = orange, fg = white }
        -- , PmenuExtraSel  = { bg = orange, fg = white }
        , PmenuSbar      = { bg = orange, fg = white }
        -- , PmenuThumb     = { bg = orange, fg = white }
        , NormalFloat   = { fg = gray.light }
        -- , FloatBorder   = { fg = '#ff0000' }
    }
    local link      = {
            Character       = 'Constant'
          , Number          = 'Constant'
          , Boolean         = 'Constant'
          , Float           = 'Constant'
          , String          = 'Constant'
          , Conditional     = 'Statement'
          , Repeat          = 'Statement'
          , Label           = 'Statement'
          , Keyword         = 'Statement'
          , Exception       = 'Statement'
          , Include         = 'PreProc'
          , Define          = 'PreProc'
          , Macro           = 'PreProc'
          , PreCondit       = 'PreProc'
          , StorageClass    = 'Type'
          , Structure       = 'Type'
          , Typedef         = 'Type'
          , SpecialChar     = 'Special'
          , Tag             = 'Special'
          , Delimiter       = 'Special'
          , SpecialComment  = 'Special'
          , Debug           = 'Special'
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
