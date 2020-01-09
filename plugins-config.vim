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
let g:coc_global_extensions = [ 'coc-css', 'coc-explorer', 'coc-html', 'coc-json', 'coc-python', 'coc-tsserver', 'coc-ultisnips', 'coc-vimlsp', 'coc-yank', 'coc-highlight' ]
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
nmap <silent> R <Plug>(coc-refactor)
nmap <silent> <LEADER>f <Plug>(coc-format)
nnoremap <M-q> :CocCommand explorer<CR>
nnoremap <silent> <LEADER>p :<C-u>CocList -A --normal yank<CR>

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

" Emment-vim
augroup Emment
  autocmd FileType html imap <expr><TAB> emmet#expandAbbrIntelligent("\<TAB>")
  autocmd Filetype html imap ,, <ESC><C-y>n
augroup END
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/EmmetSnippets.json')), "\n"))

" Snippets
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger=',,'

" Easy motion
let g:EasyMotion_do_mapping = 0
vnoremap x <nop>
map ss <Plug>(easymotion-s2)
