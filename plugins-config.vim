" Asyncrun
let g:asyncrun_open = 10
let g:asyncrun_bell = 0
let g:asyncrun_stdin = 1

" Git
let g:gitgutter_map_keys = 0

" Comment
nmap <LEADER>c gcc
vmap <LEADER>c gc
augroup CommentType
  autocmd FileType c setlocal commentstring=//\ %s
  autocmd FileType cpp setlocal commentstring=//\ %s
  autocmd FileType csharp setlocal commentstring=//\ %s
  autocmd FileType java setlocal commentstring=//\ %s
  autocmd FileType go setlocal commentstring=//\ %s
augroup END

" AutoPairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''

" Coc
let g:coc_global_extensions = [ 'coc-css', 'coc-explorer', 'coc-html', 'coc-json', 'coc-python', 'coc-tsserver', 'coc-vimlsp', 'coc-yank', 'coc-highlight', 'coc-emmet', 'coc-snippets' ]
nmap <silent> R <Plug>(coc-rename)
nmap <silent> <LEADER>f <Plug>(coc-format)
nnoremap <M-q> :CocCommand explorer<CR>
nnoremap <silent> <LEADER>p :<C-u>CocList -A --normal yank<CR>
inoremap <silent><expr> <C-Space> coc#refresh()
" Use <TAB> to accept
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand',''])\<CR>" :
  \ "\<C-y>"
" Use <C-j>/<C-k> to jump to next expand on select next suggestion
inoremap <silent> <expr> <C-j>
  \ pumvisible() ? "\<C-n>" :
  \ "\<C-j>"
inoremap <silent> <expr> <C-k>
  \ pumvisible() ? "\<C-p>" :
  \ "\<C-k>"

" Start screen
let g:startify_files_number = 8
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
let g:startify_skiplist = [
  \ '^/tmp',
  \ ]
let g:startify_bookmarks = [
  \ '~/.config/nvim/init.vim',
  \]
let g:startify_custom_header = [
  \ '   _____                      _    ___         ',
  \ '  /__  /  ___  _________     | |  / (_)___ ___ ',
  \ '    / /  / _ \/ ___/ __ \    | | / / / __ `__ \',
  \ '   / /__/  __/ /  / /_/ /    | |/ / / / / / / /',
  \ '  /____/\___/_/   \____/     |___/_/_/ /_/ /_/ ',
  \]
let g:startify_custom_footer = [
  \ '  Zer0 Studio - yzy1',
  \]

" Status line
let g:airline_powerline_fonts = 1

" Colorscheme
set termguicolors
set background=dark
let g:allow_italics = 1
colorscheme OnePro
let g:airline_theme='OnePro'
highlight CocErrorHighlight gui=undercurl guisp=red
highlight CocWarningHighlight gui=undercurl guisp=green

" IndentLine
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'

" Function list
nnoremap <M-w> :Vista!!<CR>
nnoremap <C-Space> :Vista finder fzf<CR>

" Undotree
let g:undotree_DiffAutoOpen = 0
nnoremap U :redo<CR>
noremap <M-e> :UndotreeToggle<CR>

" C/C++
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let c_no_curly_error = 1

" Switch
let g:switch_mapping = 'sw'
let g:switch_custom_definitions = [
\   ['0', '1']
\ ]

" Snippets
let g:UltiSnipsExpandTrigger='<C-e>'
let g:UltiSnipsJumpForwardTrigger=',,'

" Easy motion
let g:EasyMotion_do_mapping = 0
vnoremap x <nop>
map ss <Plug>(easymotion-s2)
