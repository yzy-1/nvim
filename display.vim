syntax enable
syntax on
set number
set relativenumber
set cursorline
set noshowmode
set ruler
set wrap
set novisualbell
set showmatch
set showcmd
set wildmenu
set scrolloff=10
set tw=0
set indentexpr=
set backspace=indent,eol,start
augroup FoldMethod
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=99
augroup NoRepeatComment
	autocmd!
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set laststatus=2
set autochdir

set splitright
set splitbelow

set colorcolumn=100
set virtualedit=block

set guifont=Input:h13.5

" Color scheme
set termguicolors
set background=dark
colorscheme OnePro
highlight CocErrorHighlight gui=undercurl guisp=red
highlight CocWarningHighlight gui=undercurl guisp=green
