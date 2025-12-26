" namu-dark.vim - colorscheme
" Namu Dark - Korean Night Ink
" Generated from a VS Code theme JSON

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'namu-dark'
set background=dark

let s:palette = {}
let s:palette.bg = '#1e1c1a'
let s:palette.fg = '#e3ded7'
let s:palette.line_nr = '#6d665f'
let s:palette.line_nr_active = '#b6ada3'
let s:palette.sel = '#3e3a35'
let s:palette.sel_inactive = '#2f2b27'
let s:palette.cursor = '#d0c49e'
let s:palette.ws = '#3a3733'
let s:palette.indent = '#2b2825'
let s:palette.indent_active = '#4e4944'
let s:palette.sidebar_bg = '#24211f'
let s:palette.sidebar_fg = '#d5cfc6'
let s:palette.status_bg = '#2f2b27'
let s:palette.status_fg = '#d7d0c6'
let s:palette.title_bg = '#2a2724'
let s:palette.title_fg = '#ddd6cc'
let s:palette.comment = '#847e77'
let s:palette.string = '#4e74ad'
let s:palette.keyword = '#1a9b80'
let s:palette.var = '#7e77c3'
let s:palette.const = '#c99252'
let s:palette.func = '#6db09d'
let s:palette.type = '#ae6890'
let s:palette.punct = '#9d938b'
let s:palette.regex = '#d98a5e'
let s:palette.langvar = '#d75a5a'

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr) abort
  execute 'hi' a:group
        \ 'gui=' . a:attr . ' cterm=' . a:attr
        \ 'guifg=' . a:guifg . ' guibg=' . a:guibg
        \ 'ctermfg=' . a:ctermfg . ' ctermbg=' . a:ctermbg
endfunction

call s:hi('Normal', '#e3ded7', '#1e1c1a', '253', '234', 'NONE')
call s:hi('NormalNC', '#e3ded7', '#1e1c1a', '253', '234', 'NONE')
call s:hi('Comment', '#847e77', 'NONE', '244', 'NONE', 'italic')
call s:hi('LineNr', '#6d665f', '#1e1c1a', '241', '234', 'NONE')
call s:hi('CursorLineNr', '#b6ada3', '#1e1c1a', '145', '234', 'bold')
call s:hi('CursorLine', 'NONE', '#2f2b27', 'NONE', '236', 'NONE')
call s:hi('ColorColumn', 'NONE', '#2f2b27', 'NONE', '236', 'NONE')
call s:hi('Visual', 'NONE', '#3e3a35', 'NONE', '237', 'NONE')
call s:hi('Cursor', '#1e1c1a', '#d0c49e', '234', '187', 'NONE')
call s:hi('Whitespace', '#3a3733', '#1e1c1a', '237', '234', 'NONE')
call s:hi('NonText', '#3a3733', '#1e1c1a', '237', '234', 'NONE')
call s:hi('VertSplit', '#2b2825', '#1e1c1a', '235', '234', 'NONE')
call s:hi('WinSeparator', '#2b2825', '#1e1c1a', '235', '234', 'NONE')
call s:hi('StatusLine', '#d7d0c6', '#2f2b27', '252', '236', 'bold')
call s:hi('StatusLineNC', '#6d665f', '#2f2b27', '241', '236', 'NONE')
call s:hi('Pmenu', '#e3ded7', '#2f2b27', '253', '236', 'NONE')
call s:hi('PmenuSel', '#e3ded7', '#3e3a35', '253', '237', 'bold')
call s:hi('PmenuSbar', 'NONE', '#2f2b27', 'NONE', '236', 'NONE')
call s:hi('PmenuThumb', 'NONE', '#4e4944', 'NONE', '238', 'NONE')
call s:hi('Search', '#1e1c1a', '#c99252', '234', '173', 'bold')
call s:hi('IncSearch', '#1e1c1a', '#d75a5a', '234', '167', 'bold')
call s:hi('MatchParen', '#e3ded7', '#2f2b27', '253', '236', 'bold')
call s:hi('Directory', '#4e74ad', 'NONE', '67', 'NONE', 'NONE')
call s:hi('Title', '#ddd6cc', 'NONE', '188', 'NONE', 'bold')
call s:hi('String', '#4e74ad', 'NONE', '67', 'NONE', 'NONE')
call s:hi('Character', '#4e74ad', 'NONE', '67', 'NONE', 'NONE')
call s:hi('Number', '#c99252', 'NONE', '173', 'NONE', 'NONE')
call s:hi('Float', '#c99252', 'NONE', '173', 'NONE', 'NONE')
call s:hi('Boolean', '#c99252', 'NONE', '173', 'NONE', 'NONE')
call s:hi('Constant', '#c99252', 'NONE', '173', 'NONE', 'NONE')
call s:hi('Identifier', '#7e77c3', 'NONE', '104', 'NONE', 'NONE')
call s:hi('Function', '#6db09d', 'NONE', '73', 'NONE', 'NONE')
call s:hi('Statement', '#1a9b80', 'NONE', '36', 'NONE', 'bold')
call s:hi('Keyword', '#1a9b80', 'NONE', '36', 'NONE', 'bold')
call s:hi('Conditional', '#d75a5a', 'NONE', '167', 'NONE', 'NONE')
call s:hi('Repeat', '#d75a5a', 'NONE', '167', 'NONE', 'NONE')
call s:hi('Operator', '#9d938b', 'NONE', '246', 'NONE', 'NONE')
call s:hi('Delimiter', '#9d938b', 'NONE', '246', 'NONE', 'NONE')
call s:hi('Type', '#ae6890', 'NONE', '132', 'NONE', 'NONE')
call s:hi('StorageClass', '#ae6890', 'NONE', '132', 'NONE', 'NONE')
call s:hi('Structure', '#ae6890', 'NONE', '132', 'NONE', 'NONE')
call s:hi('Typedef', '#ae6890', 'NONE', '132', 'NONE', 'NONE')
call s:hi('PreProc', '#1a9b80', 'NONE', '36', 'NONE', 'bold')
call s:hi('Include', '#1a9b80', 'NONE', '36', 'NONE', 'bold')
call s:hi('Define', '#1a9b80', 'NONE', '36', 'NONE', 'bold')
call s:hi('Macro', '#1a9b80', 'NONE', '36', 'NONE', 'bold')
call s:hi('Special', '#d98a5e', 'NONE', '173', 'NONE', 'NONE')
call s:hi('SpecialChar', '#d98a5e', 'NONE', '173', 'NONE', 'NONE')
call s:hi('Error', '#d75a5a', '#1e1c1a', '167', '234', 'bold')
call s:hi('ErrorMsg', '#d75a5a', '#1e1c1a', '167', '234', 'bold')
call s:hi('WarningMsg', '#c99252', '#1e1c1a', '173', '234', 'bold')
call s:hi('Todo', '#1e1c1a', '#c99252', '234', '173', 'bold')
call s:hi('DiffAdd', '#e3ded7', '#1a9b80', '253', '36', 'NONE')
call s:hi('DiffChange', '#e3ded7', '#4e74ad', '253', '67', 'NONE')
call s:hi('DiffDelete', '#e3ded7', '#d75a5a', '253', '167', 'NONE')
call s:hi('DiffText', '#1e1c1a', '#ae6890', '234', '132', 'bold')

" Treesitter links:
silent! hi! link @comment Comment
silent! hi! link @string String
silent! hi! link @character Character
silent! hi! link @number Number
silent! hi! link @boolean Boolean
silent! hi! link @float Float
silent! hi! link @constant Constant
silent! hi! link @constant.builtin Constant
silent! hi! link @function Function
silent! hi! link @function.builtin Function
silent! hi! link @keyword Keyword
silent! hi! link @keyword.function Keyword
silent! hi! link @keyword.return Keyword
silent! hi! link @conditional Conditional
silent! hi! link @repeat Repeat
silent! hi! link @operator Operator
silent! hi! link @type Type
silent! hi! link @type.builtin Type
silent! hi! link @punctuation.delimiter Delimiter
silent! hi! link @punctuation.bracket Delimiter
silent! hi! link @variable Identifier
silent! hi! link @variable.builtin Identifier
silent! hi! link @property Identifier
silent! hi! link @field Identifier
silent! hi! link @parameter Identifier
silent! hi! link @namespace Directory
silent! hi! link @include Include
silent! hi! link @preproc PreProc
silent! hi! link @exception Error
silent! hi! link @text.todo Todo

" Neovim terminal palette (best-effort):
if has('nvim')
  let g:terminal_color_0  = '#1e1c1a'
  let g:terminal_color_7  = '#e3ded7'
  let g:terminal_color_8  = '#6d665f'
  let g:terminal_color_1  = '#d75a5a'
  let g:terminal_color_2  = '#1a9b80'
  let g:terminal_color_3  = '#c99252'
  let g:terminal_color_4  = '#4e74ad'
  let g:terminal_color_5  = '#7e77c3'
  let g:terminal_color_6  = '#6db09d'
  let g:terminal_color_15 = '#ddd6cc'
endif
