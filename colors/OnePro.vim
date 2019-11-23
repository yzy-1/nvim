" Name:    OnePro vim colorscheme
" Author:  yzy1
" License: MIT
" Version: 1.1.1-pre
" BasedOn: one

" Global setup =============================================================={{{

if exists("*<SID>X")
  delf <SID>X
  delf <SID>XAPI
  delf <SID>rgb
  delf <SID>color
  delf <SID>rgb_color
  delf <SID>rgb_level
  delf <SID>rgb_number
  delf <SID>grey_color
  delf <SID>grey_level
  delf <SID>grey_number
endif

hi clear
syntax reset
if exists('g:colors_name')
  unlet g:colors_name
endif
let g:colors_name = 'OnePro'

if !exists('g:one_allow_italics')
  let g:one_allow_italics = 0
endif

if has('gui_running') || has('termguicolors') || &t_Co == 88 || &t_Co == 256
  " functions
  " returns an approximate grey index for the given grey level

  " Utility functions -------------------------------------------------------{{{
  fun <SID>grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun <SID>grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " returns the palette index for the given grey index
  fun <SID>grey_color(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " returns an approximate color index for the given color level
  fun <SID>rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
      if a:x < 75
        return 0
      else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual color level for the given color index
  fun <SID>rgb_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 139
      elseif a:n == 2
        return 205
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 55 + (a:n * 40)
      endif
    endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun <SID>rgb_color(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " returns the palette index to approximate the given R/G/B color levels
  fun <SID>color(r, g, b)
    " get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " get the closest color
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " there are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " use the grey
        return <SID>grey_color(l:gx)
      else
        " use the color
        return <SID>rgb_color(l:x, l:y, l:z)
      endif
    else
      " only one possibility
      return <SID>rgb_color(l:x, l:y, l:z)
    endif
  endfun

  " returns the palette index to approximate the 'rrggbb' hex string
  fun <SID>rgb(rgb)
    let l:r = ('0x' . strpart(a:rgb, 0, 2)) + 0
    let l:g = ('0x' . strpart(a:rgb, 2, 2)) + 0
    let l:b = ('0x' . strpart(a:rgb, 4, 2)) + 0

    return <SID>color(l:r, l:g, l:b)
  endfun

  " sets the highlighting for the given group
  fun <SID>XAPI(group, fg, bg, attr)
    let l:attr = a:attr
    if g:one_allow_italics == 0 && l:attr ==? 'italic'
      let l:attr= 'none'
    endif

    let l:bg = ""
    let l:fg = ""
    let l:decoration = ""

    if a:bg != ''
      let l:bg = " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
    endif

    if a:fg != ''
      let l:fg = " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
    endif

    if a:attr != ''
      let l:decoration = " gui=" . l:attr . " cterm=" . l:attr
    endif

    let l:exec = l:fg . l:bg . l:decoration

    if l:exec != ''
      exec "hi " . a:group . l:exec
    endif

  endfun

  " Highlight function
  " the original one is borrowed from mhartington/oceanic-next
  function! <SID>X(group, fg, bg, attr, ...)
    let l:attrsp = get(a:, 1, "")
    " fg, bg, attr, attrsp
    if !empty(a:fg)
      exec "hi " . a:group . " guifg=" .  a:fg[0]
      exec "hi " . a:group . " ctermfg=" . a:fg[1]
    endif
    if !empty(a:bg)
      exec "hi " . a:group . " guibg=" .  a:bg[0]
      exec "hi " . a:group . " ctermbg=" . a:bg[1]
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" .   a:attr
      exec "hi " . a:group . " cterm=" . a:attr
    endif
    if !empty(l:attrsp)
      exec "hi " . a:group . " guisp=" . l:attrsp[0]
    endif
  endfunction

  " }}}


  " Color definition --------------------------------------------------------{{{
  let s:dark = 0
  if &background ==# 'dark'
    let s:dark = 1
    let s:mono_1 = ['#abb2bf', '145']
    let s:mono_2 = ['#828997', '102']
    let s:mono_3 = ['#5c6370', '59']
    let s:mono_4 = ['#4b5263', '59']

    let s:cyan  = ['#56b6c2', '73'] " cyan
    let s:blue  = ['#61afef', '75'] " blue
    let s:purple  = ['#c678dd', '176'] " purple
    let s:green  = ['#98c379', '114'] " green

    let s:red1   = ['#e06c75', '168'] " red 1
    let s:red2 = ['#be5046', '130'] " red 2

    let s:orange1   = ['#d19a66', '173'] " orange 1
    let s:orange2 = ['#e5c07b', '180'] " orange 2

    let s:syntax_bg     = ['#282c34', '16']
    " let s:syntax_bg     = ['none', '16']
    let s:syntax_gutter = ['#636d83', '60']
    let s:syntax_cursor = ['#3c424c', '16']

    let s:syntax_accent = ['#528bff', '69']

    let s:vertsplit    = ['#181a1f', '233']
    let s:special_grey = ['#3b4048', '16']
    let s:visual_grey  = ['#3e4452', '17']
    let s:pmenu        = ['#333841', '16']
  else
    let s:mono_1 = ['#494b53', '23']
    let s:mono_2 = ['#696c77', '60']
    let s:mono_3 = ['#a0a1a7', '145']
    let s:mono_4 = ['#c2c2c3', '250']

    let s:cyan  = ['#0184bc', '31'] " cyan
    let s:blue  = ['#4078f2', '33'] " blue
    let s:purple  = ['#a626a4', '127'] " purple
    let s:green  = ['#50a14f', '71'] " green

    let s:red1   = ['#e45649', '166'] " red 1
    let s:red2 = ['#ca1243', '160'] " red 2

    let s:orange1   = ['#986801', '94'] " orange 1
    let s:orange2 = ['#c18401', '136'] " orange 2

    let s:syntax_bg     = ['#fafafa', '255']
    let s:syntax_gutter = ['#9e9e9e', '247']
    let s:syntax_cursor = ['#f0f0f0', '254']

    let s:syntax_accent = ['#526fff', '63']
    let s:syntax_accent_2 = ['#0083be', '31']

    let s:vertsplit    = ['#e7e9e1', '188']
    let s:special_grey = ['#d3d3d3', '251']
    let s:visual_grey  = ['#d0d0d0', '251']
    let s:pmenu        = ['#dfdfdf', '253']
  endif

  let s:syntax_fg = s:mono_1
  let s:syntax_fold_bg = s:mono_3

  " }}}

  " Vim editor color --------------------------------------------------------{{{
  call <sid>X('Normal',       s:syntax_fg,     s:syntax_bg,      '')
  call <sid>X('bold',         '',              '',               'bold')
  call <sid>X('ColorColumn',  '',              s:syntax_cursor,  '')
  call <sid>X('Conceal',      s:mono_4,        s:syntax_bg,      '')
  call <sid>X('Cursor',       '',              s:syntax_accent,  '')
  call <sid>X('CursorIM',     '',              '',               '')
  call <sid>X('CursorColumn', '',              s:syntax_cursor,  '')
  call <sid>X('CursorLine',   '',              s:syntax_cursor,  'none')
  call <sid>X('Directory',    s:blue,         '',               '')
  call <sid>X('ErrorMsg',     s:red1,         s:syntax_bg,      'none')
  call <sid>X('VertSplit',    s:vertsplit,     '',               'none')
  call <sid>X('Folded',       s:syntax_bg,     s:syntax_fold_bg, 'none')
  call <sid>X('FoldColumn',   s:mono_3,        s:syntax_cursor,  '')
  call <sid>X('IncSearch',    s:orange1,         '',               '')
  call <sid>X('LineNr',       s:mono_4,        '',               '')
  call <sid>X('CursorLineNr', s:syntax_fg,     s:syntax_cursor,  'none')
  call <sid>X('MatchParen',   s:red1,         s:syntax_cursor,  'underline,bold')
  call <sid>X('Italic',       '',              '',               'italic')
  call <sid>X('ModeMsg',      s:syntax_fg,     '',               '')
  call <sid>X('MoreMsg',      s:syntax_fg,     '',               '')
  call <sid>X('NonText',      s:mono_3,        '',               'none')
  call <sid>X('PMenu',        '',              s:pmenu,          '')
  call <sid>X('PMenuSel',     '',              s:mono_4,         '')
  call <sid>X('PMenuSbar',    '',              s:syntax_bg,      '')
  call <sid>X('PMenuThumb',   '',              s:mono_1,         '')
  call <sid>X('Question',     s:blue,         '',               '')
  call <sid>X('Search',       s:syntax_bg,     s:orange2,        '')
  call <sid>X('SpecialKey',   s:special_grey,  '',               'none')
  call <sid>X('Whitespace',   s:special_grey,  '',               'none')
  call <sid>X('StatusLine',   s:syntax_fg,     s:syntax_cursor,  'none')
  call <sid>X('StatusLineNC', s:mono_3,        '',               '')
  call <sid>X('TabLine',      s:mono_1,        s:syntax_bg,      '')
  call <sid>X('TabLineFill',  s:mono_3,        s:visual_grey,    'none')
  call <sid>X('TabLineSel',   s:syntax_bg,     s:blue,          '')
  call <sid>X('Title',        s:syntax_fg,     '',               'bold')
  call <sid>X('Visual',       '',              s:visual_grey,    '')
  call <sid>X('VisualNOS',    '',              s:visual_grey,    '')
  call <sid>X('WarningMsg',   s:red1,         '',               '')
  call <sid>X('TooLong',      s:red1,         '',               '')
  call <sid>X('WildMenu',     s:syntax_fg,     s:mono_3,         '')
  call <sid>X('SignColumn',   '',              s:syntax_bg,      '')
  call <sid>X('Special',      s:blue,         '',               '')
  " }}}

  " Vim Help highlighting ---------------------------------------------------{{{
  call <sid>X('helpCommand',      s:orange2, '', '')
  call <sid>X('helpExample',      s:orange2, '', '')
  call <sid>X('helpHeader',       s:mono_1,  '', 'bold')
  call <sid>X('helpSectionDelim', s:mono_3,  '', '')
  " }}}

  " Standard syntax highlighting --------------------------------------------{{{
  call <sid>X('Comment',        s:mono_3,        '',          'none')
  call <sid>X('Constant',       s:red1,         '',          '')
  call <sid>X('String',         s:green,         '',          '')
  call <sid>X('Character',      s:green,         '',          '')
  call <sid>X('Number',         s:orange1,         '',          '')
  call <sid>X('Boolean',        s:orange1,         '',          '')
  call <sid>X('Float',          s:orange1,         '',          '')
  call <sid>X('Identifier',     s:red1,         '',          'none')
  call <sid>X('Function',       s:blue,         '',          '')
  call <sid>X('Statement',      s:purple,         '',          'none')
  call <sid>X('Conditional',    s:purple,         '',          '')
  call <sid>X('Repeat',         s:purple,         '',          '')
  call <sid>X('Label',          s:red1,         '',          '')
  call <sid>X('Operator',       s:mono_2,         '',          'none')
  call <sid>X('Keyword',        s:purple,         '',          '')
  call <sid>X('Exception',      s:purple,         '',          '')
  call <sid>X('PreProc',        s:orange2,       '',          '')
  call <sid>X('Include',        s:purple,         '',          '')
  call <sid>X('Define',         s:purple,         '',          'none')
  call <sid>X('Macro',          s:purple,         '',          '')
  call <sid>X('PreCondit',      s:orange2,       '',          '')
  call <sid>X('Type',           s:orange2,       '',          'none')
  call <sid>X('StorageClass',   s:orange2,       '',          '')
  call <sid>X('Structure',      s:orange2,       '',          '')
  call <sid>X('Typedef',        s:orange2,       '',          '')
  call <sid>X('Special',        s:blue,         '',          '')
  call <sid>X('SpecialChar',    s:cyan,              '',          '')
  call <sid>X('Tag',            '',              '',          '')
  call <sid>X('Delimiter',      '',              '',          '')
  call <sid>X('SpecialComment', '',              '',          '')
  call <sid>X('Debug',          '',              '',          '')
  call <sid>X('Underlined',     '',              '',          'underline')
  call <sid>X('Ignore',         '',              '',          '')
  call <sid>X('Error',          s:red1,         s:syntax_bg, 'bold')
  call <sid>X('Todo',           s:mono_4,       s:orange2,   '')
  " }}}

  " Diff highlighting -------------------------------------------------------{{{
  call <sid>X('DiffAdd',     s:green, s:visual_grey, '')
  call <sid>X('DiffChange',  s:orange1, s:visual_grey, '')
  call <sid>X('DiffDelete',  s:red1, s:visual_grey, '')
  call <sid>X('DiffText',    s:blue, s:visual_grey, '')
  call <sid>X('DiffAdded',   s:green, s:visual_grey, '')
  call <sid>X('DiffFile',    s:red1, s:visual_grey, '')
  call <sid>X('DiffNewFile', s:green, s:visual_grey, '')
  call <sid>X('DiffLine',    s:blue, s:visual_grey, '')
  call <sid>X('DiffRemoved', s:red1, s:visual_grey, '')
  " }}}

  " Asciidoc highlighting ---------------------------------------------------{{{
  call <sid>X('asciidocListingBlock',   s:mono_2,  '', '')
  " }}}

  " C/C++ highlighting ------------------------------------------------------{{{
  call <sid>X('cInclude',           s:purple,  '', '')
  call <sid>X('cPreCondit',         s:purple,  '', '')
  call <sid>X('cPreConditMatch',    s:purple,  '', '')

  call <sid>X('cType',              s:purple,  '', '')
  call <sid>X('cStorageClass',      s:purple,  '', '')
  call <sid>X('cStructure',         s:purple,  '', '')
  call <sid>X('cOperator',          s:purple,  '', '')
  call <sid>X('cStatement',         s:purple,  '', '')
  call <sid>X('cConstant',          s:red1,  '', '')
  call <sid>X('cSpecial',           s:cyan,  '', '')
  call <sid>X('cSpecialCharacter',  s:cyan,  '', '')
  call <sid>X('cString',            s:green,  '', '')

  call <sid>X('cppType',            s:purple,  '', '')
  call <sid>X('cppStorageClass',    s:purple,  '', '')
  call <sid>X('cppStructure',       s:purple,  '', '')
  call <sid>X('cppModifier',        s:purple,  '', '')
  call <sid>X('cppOperator',        s:purple,  '', '')
  call <sid>X('cppAccess',          s:purple,  '', '')
  call <sid>X('cppStatement',       s:purple,  '', '')
  call <sid>X('cppConstant',        s:red1,  '', '')
  call <sid>X('cCppString',         s:green,  '', '')
  " }}}

  " Cucumber highlighting ---------------------------------------------------{{{
  call <sid>X('cucumberGiven',           s:blue,  '', '')
  call <sid>X('cucumberWhen',            s:blue,  '', '')
  call <sid>X('cucumberWhenAnd',         s:blue,  '', '')
  call <sid>X('cucumberThen',            s:blue,  '', '')
  call <sid>X('cucumberThenAnd',         s:blue,  '', '')
  call <sid>X('cucumberUnparsed',        s:orange1,  '', '')
  call <sid>X('cucumberFeature',         s:red1,  '', 'bold')
  call <sid>X('cucumberBackground',      s:purple,  '', 'bold')
  call <sid>X('cucumberScenario',        s:purple,  '', 'bold')
  call <sid>X('cucumberScenarioOutline', s:purple,  '', 'bold')
  call <sid>X('cucumberTags',            s:mono_3, '', 'bold')
  call <sid>X('cucumberDelimiter',       s:mono_3, '', 'bold')
  " }}}

  " CSS/Sass highlighting ---------------------------------------------------{{{
  call <sid>X('cssAttrComma',         s:mono_2,  '', '')
  call <sid>X('cssAttributeSelector', s:blue,  '', '')
  call <sid>X('cssBraces',            s:mono_2, '', '')
  call <sid>X('cssClassName',         s:red1,  '', '')
  call <sid>X('cssClassNameDot',      s:red1,  '', '')
  call <sid>X('cssDefinition',        s:purple,  '', '')
  call <sid>X('cssFontAttr',          s:orange1,  '', '')
  call <sid>X('cssFontDescriptor',    s:purple,  '', '')
  call <sid>X('cssFunctionName',      s:blue,  '', '')
  call <sid>X('cssIdentifier',        s:blue,  '', '')
  call <sid>X('cssImportant',         s:purple,  '', '')
  call <sid>X('cssInclude',           s:mono_1, '', '')
  call <sid>X('cssIncludeKeyword',    s:purple,  '', '')
  call <sid>X('cssMediaType',         s:orange1,  '', '')
  call <sid>X('cssProp',              s:red1,  '', '')
  call <sid>X('cssPseudoClassId',     s:orange1,  '', '')
  call <sid>X('cssSelectorOp',        s:mono_1,  '', '')
  call <sid>X('cssSelectorOp2',       s:mono_1,  '', '')
  call <sid>X('cssStringQ',           s:green,  '', '')
  call <sid>X('cssStringQQ',          s:green,  '', '')
  call <sid>X('cssTagName',           s:orange1,  '', '')
  call <sid>X('cssAttr',              s:cyan,  '', '')

  call <sid>X('sassAmpersand',      s:red1,   '', '')
  call <sid>X('sassClass',          s:orange2, '', '')
  call <sid>X('sassControl',        s:purple,   '', '')
  call <sid>X('sassExtend',         s:purple,   '', '')
  call <sid>X('sassFor',            s:mono_1,  '', '')
  call <sid>X('sassProperty',       s:cyan,   '', '')
  call <sid>X('sassFunction',       s:cyan,   '', '')
  call <sid>X('sassId',             s:blue,   '', '')
  call <sid>X('sassInclude',        s:purple,   '', '')
  call <sid>X('sassMedia',          s:purple,   '', '')
  call <sid>X('sassMediaOperators', s:mono_1,  '', '')
  call <sid>X('sassMixin',          s:purple,   '', '')
  call <sid>X('sassMixinName',      s:blue,   '', '')
  call <sid>X('sassMixing',         s:purple,   '', '')

  call <sid>X('scssSelectorName',   s:orange2, '', '')
  " }}}

  " Elixir highlighting------------------------------------------------------{{{
  hi link elixirModuleDefine Define
  call <sid>X('elixirAlias',             s:orange2, '', '')
  call <sid>X('elixirAtom',              s:cyan,   '', '')
  call <sid>X('elixirBlockDefinition',   s:purple,   '', '')
  call <sid>X('elixirModuleDeclaration', s:orange1,   '', '')
  call <sid>X('elixirInclude',           s:red1,   '', '')
  call <sid>X('elixirOperator',          s:orange1,   '', '')
  " }}}

  " Git and git related plugins highlighting --------------------------------{{{
  call <sid>X('gitcommitComment',       s:mono_3,  '', '')
  call <sid>X('gitcommitUnmerged',      s:green,   '', '')
  call <sid>X('gitcommitOnBranch',      '',        '', '')
  call <sid>X('gitcommitBranch',        s:purple,   '', '')
  call <sid>X('gitcommitDiscardedType', s:red1,   '', '')
  call <sid>X('gitcommitSelectedType',  s:green,   '', '')
  call <sid>X('gitcommitHeader',        '',        '', '')
  call <sid>X('gitcommitUntrackedFile', s:cyan,   '', '')
  call <sid>X('gitcommitDiscardedFile', s:red1,   '', '')
  call <sid>X('gitcommitSelectedFile',  s:green,   '', '')
  call <sid>X('gitcommitUnmergedFile',  s:orange2, '', '')
  call <sid>X('gitcommitFile',          '',        '', '')
  hi link gitcommitNoBranch       gitcommitBranch
  hi link gitcommitUntracked      gitcommitComment
  hi link gitcommitDiscarded      gitcommitComment
  hi link gitcommitSelected       gitcommitComment
  hi link gitcommitDiscardedArrow gitcommitDiscardedFile
  hi link gitcommitSelectedArrow  gitcommitSelectedFile
  hi link gitcommitUnmergedArrow  gitcommitUnmergedFile

  call <sid>X('SignifySignAdd',    s:green,   '', '')
  call <sid>X('SignifySignChange', s:orange2, '', '')
  call <sid>X('SignifySignDelete', s:red1,   '', '')
  hi link GitGutterAdd    SignifySignAdd
  hi link GitGutterChange SignifySignChange
  hi link GitGutterDelete SignifySignDelete
  call <sid>X('diffAdded',         s:green,   '', '')
  call <sid>X('diffRemoved',       s:red1,   '', '')
  " }}}

  " Go highlighting ---------------------------------------------------------{{{
  call <sid>X('goDeclaration',         s:purple, '', '')
  call <sid>X('goField',               s:red1, '', '')
  call <sid>X('goMethod',              s:cyan, '', '')
  call <sid>X('goType',                s:purple, '', '')
  call <sid>X('goUnsignedInts',        s:cyan, '', '')
  " }}}

  " Haskell highlighting ----------------------------------------------------{{{
  call <sid>X('haskellDeclKeyword',    s:blue, '', '')
  call <sid>X('haskellType',           s:green, '', '')
  call <sid>X('haskellWhere',          s:red1, '', '')
  call <sid>X('haskellImportKeywords', s:blue, '', '')
  call <sid>X('haskellOperators',      s:red1, '', '')
  call <sid>X('haskellDelimiter',      s:blue, '', '')
  call <sid>X('haskellIdentifier',     s:orange1, '', '')
  call <sid>X('haskellKeyword',        s:red1, '', '')
  call <sid>X('haskellNumber',         s:cyan, '', '')
  call <sid>X('haskellString',         s:cyan, '', '')
  "}}}

  " HTML highlighting -------------------------------------------------------{{{
  call <sid>X('htmlArg',            s:orange1,  '', '')
  call <sid>X('htmlTagName',        s:red1,  '', '')
  call <sid>X('htmlTagN',           s:red1,  '', '')
  call <sid>X('htmlSpecialTagName', s:red1,  '', '')
  call <sid>X('htmlTag',            s:mono_2, '', '')
  call <sid>X('htmlEndTag',         s:mono_2, '', '')

  call <sid>X('MatchTag', s:red1, s:syntax_cursor, 'underline,bold')
  " }}}

  " JavaScript highlighting -------------------------------------------------{{{
  call <sid>X('coffeeString',           s:green,   '', '')

  call <sid>X('javaScriptBraces',       s:mono_2,  '', '')
  call <sid>X('javaScriptFunction',     s:purple,   '', '')
  call <sid>X('javaScriptIdentifier',   s:purple,   '', '')
  call <sid>X('javaScriptNull',         s:orange1,   '', '')
  call <sid>X('javaScriptNumber',       s:orange1,   '', '')
  call <sid>X('javaScriptRequire',      s:cyan,   '', '')
  call <sid>X('javaScriptReserved',     s:purple,   '', '')
  " https://github.com/pangloss/vim-javascript
  call <sid>X('jsArrowFunction',        s:purple,   '', '')
  call <sid>X('jsBraces',               s:mono_2,  '', '')
  call <sid>X('jsClassBraces',          s:mono_2,  '', '')
  call <sid>X('jsClassKeywords',        s:purple,   '', '')
  call <sid>X('jsDocParam',             s:blue,   '', '')
  call <sid>X('jsDocTags',              s:purple,   '', '')
  call <sid>X('jsFuncBraces',           s:mono_2,  '', '')
  call <sid>X('jsFuncCall',             s:blue,   '', '')
  call <sid>X('jsFuncParens',           s:mono_2,  '', '')
  call <sid>X('jsFunction',             s:purple,   '', '')
  call <sid>X('jsGlobalObjects',        s:orange2, '', '')
  call <sid>X('jsModuleWords',          s:purple,   '', '')
  call <sid>X('jsModules',              s:purple,   '', '')
  call <sid>X('jsNoise',                s:mono_2,  '', '')
  call <sid>X('jsNull',                 s:orange1,   '', '')
  call <sid>X('jsOperator',             s:purple,   '', '')
  call <sid>X('jsParens',               s:mono_2,  '', '')
  call <sid>X('jsStorageClass',         s:purple,   '', '')
  call <sid>X('jsTemplateBraces',       s:red2, '', '')
  call <sid>X('jsTemplateVar',          s:green,   '', '')
  call <sid>X('jsThis',                 s:red1,   '', '')
  call <sid>X('jsUndefined',            s:orange1,   '', '')
  call <sid>X('jsObjectValue',          s:blue,   '', '')
  call <sid>X('jsObjectKey',            s:cyan,   '', '')
  call <sid>X('jsReturn',               s:purple,   '', '')
  " https://github.com/othree/yajs.vim
  call <sid>X('javascriptArrowFunc',    s:purple,   '', '')
  call <sid>X('javascriptClassExtends', s:purple,   '', '')
  call <sid>X('javascriptClassKeyword', s:purple,   '', '')
  call <sid>X('javascriptDocNotation',  s:purple,   '', '')
  call <sid>X('javascriptDocParamName', s:blue,   '', '')
  call <sid>X('javascriptDocTags',      s:purple,   '', '')
  call <sid>X('javascriptEndColons',    s:mono_3,  '', '')
  call <sid>X('javascriptExport',       s:purple,   '', '')
  call <sid>X('javascriptFuncArg',      s:mono_1,  '', '')
  call <sid>X('javascriptFuncKeyword',  s:purple,   '', '')
  call <sid>X('javascriptIdentifier',   s:red1,   '', '')
  call <sid>X('javascriptImport',       s:purple,   '', '')
  call <sid>X('javascriptObjectLabel',  s:mono_1,  '', '')
  call <sid>X('javascriptOpSymbol',     s:cyan,   '', '')
  call <sid>X('javascriptOpSymbols',    s:cyan,   '', '')
  call <sid>X('javascriptPropertyName', s:green,   '', '')
  call <sid>X('javascriptTemplateSB',   s:red2, '', '')
  call <sid>X('javascriptVariable',     s:purple,   '', '')
  " }}}

  " JSON highlighting -------------------------------------------------------{{{
  let g:vim_json_syntax_conceal = 0
  call <sid>X('jsonCommentError',         s:mono_1,  '', ''        )
  call <sid>X('jsonKeyword',              s:red1,   '', ''        )
  call <sid>X('jsonQuote',                s:mono_3,  '', ''        )
  call <sid>X('jsonTrailingCommaError',   s:red1,   '', 'bold' )
  call <sid>X('jsonMissingCommaError',    s:red1,   '', 'bold' )
  call <sid>X('jsonNoQuotesError',        s:red1,   '', 'bold' )
  call <sid>X('jsonNumError',             s:red1,   '', 'bold' )
  call <sid>X('jsonString',               s:green,   '', ''        )
  call <sid>X('jsonBoolean',              s:purple,   '', ''        )
  call <sid>X('jsonNumber',               s:orange1,   '', ''        )
  call <sid>X('jsonStringSQError',        s:red1,   '', 'bold' )
  call <sid>X('jsonSemicolonError',       s:red1,   '', 'bold' )
  " }}}

  " Markdown highlighting ---------------------------------------------------{{{
  call <sid>X('markdownUrl',              s:mono_3,  '', '')
  call <sid>X('markdownBold',             s:orange1,   '', 'bold')
  call <sid>X('markdownItalic',           s:orange1,   '', 'bold')
  call <sid>X('markdownCode',             s:green,   '', '')
  call <sid>X('markdownCodeBlock',        s:red1,   '', '')
  call <sid>X('markdownCodeDelimiter',    s:green,   '', '')
  call <sid>X('markdownHeadingDelimiter', s:red2, '', '')
  call <sid>X('markdownH1',               s:red1,   '', '')
  call <sid>X('markdownH2',               s:red1,   '', '')
  call <sid>X('markdownH3',               s:red1,   '', '')
  call <sid>X('markdownH3',               s:red1,   '', '')
  call <sid>X('markdownH4',               s:red1,   '', '')
  call <sid>X('markdownH5',               s:red1,   '', '')
  call <sid>X('markdownH6',               s:red1,   '', '')
  call <sid>X('markdownListMarker',       s:red1,   '', '')
  " }}}

  " PHP highlighting --------------------------------------------------------{{{
  call <sid>X('phpClass',        s:orange2, '', '')
  call <sid>X('phpFunction',     s:blue,   '', '')
  call <sid>X('phpFunctions',    s:blue,   '', '')
  call <sid>X('phpInclude',      s:purple,   '', '')
  call <sid>X('phpKeyword',      s:purple,   '', '')
  call <sid>X('phpParent',       s:mono_3,  '', '')
  call <sid>X('phpType',         s:purple,   '', '')
  call <sid>X('phpSuperGlobals', s:red1,   '', '')
  " }}}

  " Pug (Formerly Jade) highlighting ----------------------------------------{{{
  call <sid>X('pugAttributesDelimiter',   s:orange1,    '', '')
  call <sid>X('pugClass',                 s:orange1,    '', '')
  call <sid>X('pugDocType',               s:mono_3,   '', 'italic')
  call <sid>X('pugTag',                   s:red1,    '', '')
  " }}}

  " PureScript highlighting -------------------------------------------------{{{
  call <sid>X('purescriptKeyword',          s:purple,     '', '')
  call <sid>X('purescriptModuleName',       s:syntax_fg, '', '')
  call <sid>X('purescriptIdentifier',       s:syntax_fg, '', '')
  call <sid>X('purescriptType',             s:orange2,   '', '')
  call <sid>X('purescriptTypeVar',          s:red1,     '', '')
  call <sid>X('purescriptConstructor',      s:red1,     '', '')
  call <sid>X('purescriptOperator',         s:syntax_fg, '', '')
  " }}}

  " Python highlighting -----------------------------------------------------{{{
  call <sid>X('pythonImport',               s:purple,     '', '')
  " call <sid>X('pythonBuiltin',              s:cyan,     '', '')
  call <sid>X('pythonStatement',            s:purple,     '', '')
  call <sid>X('pythonParam',                s:orange1,     '', '')
  call <sid>X('pythonEscape',               s:cyan,     '', '')
  call <sid>X('pythonSelf',                 s:orange2,    '', '')
  call <sid>X('pythonClass',                s:orange2,     '', '')
  call <sid>X('pythonOperator',             s:purple,     '', '')
  call <sid>X('pythonFunction',             s:blue,     '', '')
  call <sid>X('pythonKeyword',              s:purple,     '', '')
  call <sid>X('pythonModule',               s:purple,     '', '')
  call <sid>X('pythonStringDelimiter',      s:green,     '', '')
  call <sid>X('pythonSymbol',               s:red1,     '', '')
  " }}}

  " Ruby highlighting -------------------------------------------------------{{{
  call <sid>X('rubyBlock',                     s:purple,   '', '')
  call <sid>X('rubyBlockParameter',            s:red1,   '', '')
  call <sid>X('rubyBlockParameterList',        s:red1,   '', '')
  call <sid>X('rubyCapitalizedMethod',         s:purple,   '', '')
  call <sid>X('rubyClass',                     s:purple,   '', '')
  call <sid>X('rubyConstant',                  s:orange2, '', '')
  call <sid>X('rubyControl',                   s:purple,   '', '')
  call <sid>X('rubyDefine',                    s:purple,   '', '')
  call <sid>X('rubyEscape',                    s:red1,   '', '')
  call <sid>X('rubyFunction',                  s:blue,   '', '')
  call <sid>X('rubyGlobalVariable',            s:red1,   '', '')
  call <sid>X('rubyInclude',                   s:blue,   '', '')
  call <sid>X('rubyIncluderubyGlobalVariable', s:red1,   '', '')
  call <sid>X('rubyInstanceVariable',          s:red1,   '', '')
  call <sid>X('rubyInterpolation',             s:cyan,   '', '')
  call <sid>X('rubyInterpolationDelimiter',    s:red1,   '', '')
  call <sid>X('rubyKeyword',                   s:blue,   '', '')
  call <sid>X('rubyModule',                    s:purple,   '', '')
  call <sid>X('rubyPseudoVariable',            s:red1,   '', '')
  call <sid>X('rubyRegexp',                    s:cyan,   '', '')
  call <sid>X('rubyRegexpDelimiter',           s:cyan,   '', '')
  call <sid>X('rubyStringDelimiter',           s:green,   '', '')
  call <sid>X('rubySymbol',                    s:cyan,   '', '')
  " }}}

  " Spelling highlighting ---------------------------------------------------{{{
  call <sid>X('SpellBad',     '', s:syntax_bg, 'undercurl')
  call <sid>X('SpellLocal',   '', s:syntax_bg, 'undercurl')
  call <sid>X('SpellCap',     '', s:syntax_bg, 'undercurl')
  call <sid>X('SpellRare',    '', s:syntax_bg, 'undercurl')
  " }}}

  " Vim highlighting --------------------------------------------------------{{{
  call <sid>X('vimCommand',      s:purple,  '', '')
  call <sid>X('vimCommentTitle', s:mono_3, '', 'bold')
  call <sid>X('vimFunction',     s:blue,  '', '')
  call <sid>X('vimFuncName',     s:purple,  '', '')
  call <sid>X('vimHighlight',    s:cyan,  '', '')
  call <sid>X('vimLineComment',  s:mono_3, '', '')
  call <sid>X('vimParenSep',     s:mono_2, '', '')
  call <sid>X('vimSep',          s:mono_2, '', '')
  call <sid>X('vimUserFunc',     s:blue,  '', '')
  call <sid>X('vimVar',          s:red1,  '', '')
  " }}}

  " XML highlighting --------------------------------------------------------{{{
  call <sid>X('xmlAttrib',  s:orange2, '', '')
  call <sid>X('xmlEndTag',  s:red1,   '', '')
  call <sid>X('xmlTag',     s:red1,   '', '')
  call <sid>X('xmlTagName', s:red1,   '', '')
  " }}}

  " ZSH highlighting --------------------------------------------------------{{{
  call <sid>X('zshCommands',     s:syntax_fg, '', '')
  call <sid>X('zshDeref',        s:red1,     '', '')
  call <sid>X('zshShortDeref',   s:red1,     '', '')
  call <sid>X('zshFunction',     s:cyan,     '', '')
  call <sid>X('zshKeyword',      s:purple,     '', '')
  call <sid>X('zshSubst',        s:red1,     '', '')
  call <sid>X('zshSubstDelim',   s:mono_3,    '', '')
  call <sid>X('zshTypes',        s:purple,     '', '')
  call <sid>X('zshVariableDef',  s:orange1,     '', '')
  " }}}

  " Rust highlighting -------------------------------------------------------{{{
  call <sid>X('rustExternCrate',          s:red1,    '', 'bold')
  call <sid>X('rustIdentifier',           s:blue,    '', '')
  call <sid>X('rustDeriveTrait',          s:green,    '', '')
  call <sid>X('SpecialComment',           s:mono_3,    '', '')
  call <sid>X('rustCommentLine',          s:mono_3,    '', '')
  call <sid>X('rustCommentLineDoc',       s:mono_3,    '', '')
  call <sid>X('rustCommentLineDocError',  s:mono_3,    '', '')
  call <sid>X('rustCommentBlock',         s:mono_3,    '', '')
  call <sid>X('rustCommentBlockDoc',      s:mono_3,    '', '')
  call <sid>X('rustCommentBlockDocError', s:mono_3,    '', '')
  " }}}

  " man highlighting --------------------------------------------------------{{{
  hi link manTitle String
  call <sid>X('manFooter', s:mono_3, '', '')
  " }}}

  " ALE (Asynchronous Lint Engine) highlighting -----------------------------{{{
  call <sid>X('ALEWarningSign', s:orange2, '', '')
  call <sid>X('ALEErrorSign', s:red1,   '', '')

  " vim-startify highlighting -----------------------------{{{
  call <sid>X('StartifyHeader', s:syntax_fg,    '', '')
  call <sid>X('StartifySection', s:red1,    '', '')
  call <sid>X('StartifyNumber', s:orange1,    '', '')
  highlight StartifyBracket guifg=#585858 ctermfg=240 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  highlight StartifyFile guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  highlight StartifyNumber guifg=#ffaf5f ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  highlight StartifyPath guifg=#8a8a8a ctermfg=245 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  highlight StartifySelect guifg=#5fdfff ctermfg=81 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  highlight StartifySlash guifg=#585858 ctermfg=240 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
  highlight StartifySpecial guifg=#585858 ctermfg=240 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

   " Neovim NERDTree Background fix ------------------------------------------{{{
  call <sid>X('NERDTreeFile', s:syntax_fg, '', '')
  " }}}

  " Neovim Terminal Colors --------------------------------------------------{{{
  if has('nvim')
    let g:terminal_color_0  = "#353a44"
    let g:terminal_color_8  = "#353a44"
    let g:terminal_color_1  = "#e88388"
    let g:terminal_color_9  = "#e88388"
    let g:terminal_color_2  = "#a7cc8c"
    let g:terminal_color_10 = "#a7cc8c"
    let g:terminal_color_3  = "#ebca8d"
    let g:terminal_color_11 = "#ebca8d"
    let g:terminal_color_4  = "#72bef2"
    let g:terminal_color_12 = "#72bef2"
    let g:terminal_color_5  = "#d291e4"
    let g:terminal_color_13 = "#d291e4"
    let g:terminal_color_6  = "#65c2cd"
    let g:terminal_color_14 = "#65c2cd"
    let g:terminal_color_7  = "#e3e5e9"
    let g:terminal_color_15 = "#e3e5e9"
  endif

  " Delete functions =========================================================={{{
  " delf <SID>X
  " delf <SID>XAPI
  " delf <SID>rgb
  " delf <SID>color
  " delf <SID>rgb_color
  " delf <SID>rgb_level
  " delf <SID>rgb_number
  " delf <SID>grey_color
  " delf <SID>grey_level
  " delf <SID>grey_number
  " }}}

endif
"}}}

" Public API --------------------------------------------------------------{{{
function! OnePro#highlight(group, fg, bg, attr)
  call <sid>XAPI(a:group, a:fg, a:bg, a:attr)
endfunction
"}}}

if exists('s:dark') && s:dark
  set background=dark
endif
