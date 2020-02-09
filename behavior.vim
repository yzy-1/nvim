" Auto indent
set autoindent
set smartindent
set cindent
function! Expander()
  let line   = getline('.')
  let col    = col('.')
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# '>'
    if second ==# '<' && third ==# '/'
      return "\<C-g>u\<CR>\<C-o>==\<C-o>O"
    else
      return "\<C-g>u\<CR>"
    endif
  else
    return "\<C-g>u\<CR>"
  endif
endfunction
inoremap <expr> <CR> Expander()

" Tab -> 2 Spaces
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" List config
set list
set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to represent invisible characters.
set listchars+=nbsp:_          " ┘

" Search config
set hlsearch
exec 'nohlsearch'
set incsearch
set ignorecase
set smartcase

" Restore cursor position
augroup RestoreCursorPosition
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

set nottimeout
set updatetime=100

" Show a column line
set colorcolumn=80
set virtualedit=block
