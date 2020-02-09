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
let g:coc_global_extensions = [ 'coc-css', 'coc-explorer', 'coc-html',
      \ 'coc-json', 'coc-python', 'coc-tsserver', 'coc-vimlsp', 'coc-yank',
      \ 'coc-highlight', 'coc-emmet', 'coc-snippets']
nmap <silent> R <Plug>(coc-rename)
nnoremap <M-q> :CocCommand explorer<CR>
nnoremap <silent> <LEADER>p :<C-u>CocList -A --normal yank<CR>
inoremap <silent><expr> <C-Space> coc#refresh()

" Use <TAB> to accept
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <C-e>
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ ''
let g:coc_snippet_next = '<C-e>'
let g:coc_snippet_prev = '<C-w>'

" Use <C-j>/<C-k> to jump to next expand on select next suggestion
imap <expr> <C-j>
      \ pumvisible() ? "\<C-n>" : coc#refresh()
imap <expr> <C-k>
      \ pumvisible() ? "\<C-p>" : coc#refresh()

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
set laststatus=2

" Color scheme
set termguicolors
set background=dark
let g:gruvbox_italic = 1
colorscheme gruvbox
highlight CocErrorHighlight gui=undercurl guisp=red
highlight CocWarningHighlight gui=undercurl guisp=green

" IndentLine
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'

" Function list
nnoremap <M-w> :Vista!!<CR>
autocmd FileType vista,vista_kind nnoremap <buffer> <silent>
      \ f :<C-u>call vista#finder#fzf#Run()<CR>

" Undotree
let g:undotree_DiffAutoOpen = 0
nnoremap U :redo<CR>
noremap <M-e> :UndotreeToggle<CR>

" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" C/C++
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let c_no_curly_error = 1

" Switch
let g:switch_mapping = 'sw'
let g:switch_custom_definitions = [
      \ ['0', '1'],
      \ ['+', '-'],
      \ ]

" Snippets
let g:UltiSnipsExpandTrigger = '<C-b>'
let g:UltiSnipsJumpForwardTrigger = '<C-z>'

" Easy motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 1
let g:EasyMotion_smartcase = 1
map ss <Plug>(easymotion-s2)

" Vim Json
let g:vim_json_syntax_conceal = 0

" Formatter
autocmd BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1

autocmd FileType vim let b:autoformat_autoindent = 1

" Auto sudo
let g:suda_smart_edit = 1

" Muliple Cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" Easy Align
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
