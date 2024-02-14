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
    local green     = '#00ff00'
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
        , Function          = { fg = black.dark, style = 'bold' }

        , Underlined        = { style = 'underline' }
        , Ignore            = {}
        , Error             = { fg = accent }
        , Todo              = { fg = black.medium, bg = white, style = 'bold' }
        , Directory         = {}

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

        , ["@variable"]                     = {}
        , ["@variable.builtin"]             = { fg = accent }       -- For parameters of a function.
        , ["@variable.parameter"]           = { fg = black.dark }   -- For parameters of a function.
        , ["@variable.parameter.builtin"]   = { fg = green }        -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]V

        , ["@constant"]         = { fg = accent }
        , ["@constant.builtin"] = { fg = accent }
        , ["@constant.macro"]   = { fg = accent }

        , ["@module"]           = {}
        , ["@module.builtin"]   = {}
        , ["@label"]            = {}

        , ["@function"]             = { fg = black.dark, style = 'bold' }
        , ["@function.builtin"]     = { fg = accent }
        , ["@function.call"]        = { fg = black.dark }
        , ["@function.macro"]       = { fg = accent }
        , ["@function.method"]      = { fg = black.dark, style = 'bold' }
        , ["@function.method.call"] = { fg = black.dark }

        , ["@constructor"]  = { fg = gray.light } -- constructor calls and definitions
        , ["@operator"]     = { fg = gray.light } -- symbolic operators (e.g. + / *)

        , ["@punctuation.delimiter"]    = {} -- delimiters (e.g. ; / . / ,)
        , ["@punctuation.bracket"]      = {} -- brackets (e.g. () / {} / [])
        , ["@punctuation.special"]      = {} -- special symbols (e.g. {} in string interpolation)
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
          -- Treesitter highlights
          , ["@character"]      = 'Character'
          , ["@number"]         = "Number"
          , ["@number.float"]   = "Float"
          , ["@boolean"]        = 'Boolean'
          , ["@string"]         = "String"

          , ["@attribute"]  = 'PreProc'
          , ["@comment"]    = 'Comment'
         -- ["@character.special"] = { link = "SpecialChar" },
         -- ["@keyword.conditional"] = { link = "Conditional" },
         -- ["@constant"] = { link = "Constant" },
         -- ["@constant.builtin"] = { link = "Special" },
         -- ["@constant.macro"] = { link = "Define" },
         -- ["@keyword.debug"] = { link = "Debug" },
         -- ["@keyword.directive.define"] = { link = "Define" },
         -- ["@keyword.exception"] = { link = "Exception" },
         -- ["@keyword.import"] = { link = "Include" },
         -- ["@keyword.coroutine"] = { link = "@keyword" },
         -- ["@keyword.operator"] = { link = "@operator" },
         -- ["@keyword.return"] = { link = "@keyword" },
         -- ["@function.method"] = { link = "Function" },
         -- ["@function.method.call"] = { link = "@function.method" },
         -- ["@namespace.builtin"] = { link = "@variable.builtin" },
         -- ["@none"] = {},
         -- ["@keyword.directive"] = { link = "PreProc" },
         -- ["@keyword.repeat"] = { link = "Repeat" },
         -- ["@keyword.storage"] = { link = "StorageClass" },
         -- ["@markup.link.label"] = { link = "SpecialChar" },
         -- ["@markup.link.label.symbol"] = { link = "Identifier" },
         -- ["@tag"] = { link = "Label" },
         -- ["@tag.attribute"] = { link = "@property" },
         -- ["@tag.delimiter"] = { link = "Delimiter" },
         -- ["@markup"] = { link = "@none" },
         -- ["@markup.environment"] = { link = "Macro" },
         -- ["@markup.environment.name"] = { link = "Type" },
         -- ["@markup.raw"] = { link = "String" },
         -- ["@markup.math"] = { link = "Special" },
         -- ["@markup.strong"] = { bold = true },
         -- ["@markup.emphasis"] = { italic = true },
         -- ["@markup.strikethrough"] = { strikethrough = true },
         -- ["@markup.underline"] = { underline = true },
         -- ["@markup.heading"] = { link = "Title" },
         -- ["@comment.note"] = { fg = c.hint },
         -- ["@comment.error"] = { fg = c.error },
         -- ["@comment.hint"] = { fg = c.hint },
         -- ["@comment.info"] = { fg = c.info },
         -- ["@comment.warning"] = { fg = c.warning },
         -- ["@comment.todo"] = { fg = c.todo },
         -- ["@markup.link.url"] = { link = "Underlined" },
         -- ["@type"] = { link = "Type" },
         -- ["@type.definition"] = { link = "Typedef" },
         -- ["@type.qualifier"] = { link = "@keyword" },

         -- LSP Semantic Token Groups
         , ["@lsp.type.boolean"]    = "@boolean"
         , ["@lsp.type.parameter"]  = "@variable.parameter"
         , ["@lsp.type.comment"]    = "@comment"
         , ["@lsp.type.namespace"]  = "@module"

         -- , ["@lsp.type.builtinType"] = "@type.builtin"
         -- , ["@lsp.type.decorator"] = "@attribute"
         -- , ["@lsp.type.deriveHelper"] = "@attribute"
         -- , ["@lsp.type.enum"] = "@type"
         -- , ["@lsp.type.enumMember"] = "@constant"
         -- , ["@lsp.type.escapeSequence"] = "@string.escape"
         -- , ["@lsp.type.formatSpecifier"] = "@markup.list"
         -- , ["@lsp.type.generic"] = "@variable"
         -- , ["@lsp.type.interface"] = { fg = util.lighten(c.blue1, 0.7)
         -- , ["@lsp.type.keyword"] = "@keyword"
         -- , ["@lsp.type.lifetime"] = "@keyword.storage"
         -- , ["@lsp.type.number"] = "@number"
         -- , ["@lsp.type.operator"] = "@operator"
         -- , ["@lsp.type.property"] = "@property"
         -- , ["@lsp.type.selfKeyword"] = "@variable.builtin"
         -- , ["@lsp.type.selfTypeKeyword"] = "@variable.builtin"
         -- , ["@lsp.type.string"] = "@string"
         -- , ["@lsp.type.typeAlias"] = "@type.definition"
         -- , ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.error
         -- , ["@lsp.type.variable"] = {} -- use treesitter styles for regular variables
         -- , ["@lsp.typemod.class.defaultLibrary"] = "@type.builtin"
         -- , ["@lsp.typemod.enum.defaultLibrary"] = "@type.builtin"
         -- , ["@lsp.typemod.enumMember.defaultLibrary"] = "@constant.builtin"
         -- , ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin"
         -- , ["@lsp.typemod.keyword.async"] = "@keyword.coroutine"
         -- , ["@lsp.typemod.keyword.injected"] = "@keyword"
         -- , ["@lsp.typemod.macro.defaultLibrary"] = "@function.builtin"
         -- , ["@lsp.typemod.method.defaultLibrary"] = "@function.builtin"
         -- , ["@lsp.typemod.operator.injected"] = "@operator"
         -- , ["@lsp.typemod.string.injected"] = "@string"
         -- , ["@lsp.typemod.struct.defaultLibrary"] = "@type.builtin"
         -- , ["@lsp.typemod.type.defaultLibrary"] = { fg = util.darken(c.blue1, 0.8)
         -- , ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = util.darken(c.blue1, 0.8)
         -- , ["@lsp.typemod.variable.callable"] = "@function"
         -- , ["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin"
         -- , ["@lsp.typemod.variable.injected"] = "@variable"
         -- , ["@lsp.typemod.variable.static"] = "@constant"
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
