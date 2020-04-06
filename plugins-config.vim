" Asyncrun
let g:asyncrun_open = 10
let g:asyncrun_bell = 0
let g:asyncrun_stdin = 1

" Git
let g:gitgutter_map_keys = 0

" Comment
nmap <LEADER>c gcc
vmap <LEADER>c gc
autocmd FileType c,cpp,csharp,java,go setlocal commentstring=//\ %s

" AutoPairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''
autocmd FileType markdown let b:AutoPairs = {
      \ '(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`',
      \ '$':'$', '$$':'$$', '**':'**'}

" Coc
let g:coc_global_extensions = [ 'coc-css', 'coc-explorer', 'coc-html',
      \ 'coc-json', 'coc-python', 'coc-tsserver', 'coc-vimlsp', 'coc-yank',
      \ 'coc-highlight', 'coc-emmet', 'coc-snippets']
nmap <silent> R <Plug>(coc-rename)
nnoremap <M-q> :CocCommand explorer<CR>
noremap <silent> <LEADER>p :<C-u>CocList -A --normal yank<CR>
inoremap <silent><expr> <C-Space> coc#refresh()

" 使用 <TAB> 补全或展开 snippets
inoremap <silent><expr> <TAB>
      \ coc#expandable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<TAB>'

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

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'vivaldi-stable'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {}
      \ }
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = 'Preview: ${name}'

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
let g:multi_cursor_prev_key = ''
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" Easy Align
vmap <LEADER>a <Plug>(EasyAlign)
nmap <LEADER>a <Plug>(EasyAlign)

" FZF
noremap <C-p> :FZF<CR>
noremap <C-f> :Ag<CR>
noremap <C-b> :Buffers<CR>

" CSharp
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_server_path = $HOME.'/Software/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp.exe'

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'fzf'

autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
autocmd Filetype cs nnoremap <buffer> R :OmniSharpRename<CR><C-N>:res +5<CR>

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
  autocmd!
  autocmd FileType cs set signcolumn=yes
  autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
  if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
  if !OmniSharp#IsServerRunning() | return | endif
  let opts = {
        \ 'CallbackCount': function('s:CBReturnCount'),
        \ 'CallbackCleanup': {-> execute('sign unplace 99')}
        \}
  call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
  if a:count
    let l = getpos('.')[1]
    let f = expand('%:p')
    execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
  endif
endfunction
