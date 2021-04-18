" ===
" Asyncrun
" ===
let g:asyncrun_open = 10
let g:asyncrun_bell = 0
let g:asyncrun_stdin = 1

" ===
" auto-include
" ===
autocmd BufWritePre *.cpp :ruby CppAutoInclude::process

" ===
" AutoSudo
" ===
let g:suda_smart_edit = 1

" ===
" C/C++
" ===
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let c_no_curly_error = 1

" ===
" Coc
" ===
let g:coc_global_extensions = [
      \ 'coc-python', 'coc-vimlsp', 'coc-yank', 'coc-go',
      \ 'coc-json', 'coc-clangd', 'coc-pairs' ]
nmap <silent> R <Plug>(coc-rename)
nnoremap <M-q> :CocCommand explorer<CR>
noremap <silent> <LEADER>p :<C-u>CocList -A --normal yank<CR>
inoremap <silent><expr> <C-Space> coc#refresh()

" 跳转到上个/下个错误
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gE <Plug>(coc-diagnostic-prev)

" 跳转 definition/reference
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>\<tab><backspace>"

" 使用 <TAB> 补全或展开 snippets
inoremap <silent><expr> <TAB>
      \ coc#expandable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>checkBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! s:checkBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<TAB>'

imap <expr> <C-j>
      \ pumvisible() ? "\<C-n>" : coc#refresh()
imap <expr> <C-k>
      \ pumvisible() ? "\<C-p>" : coc#refresh()

" 高亮选中的单词
autocmd CursorHold * silent call CocActionAsync('highlight')

" Function textobj
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" 使用 D 查看文档
nnoremap <silent> D :call <SID>showDocumentation()<CR>

function! s:showDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ===
" Commenter
" ===
nmap <LEADER>c gcc
vmap <LEADER>c gc
autocmd FileType c,cpp,csharp,java,go setlocal commentstring=//\ %s

" ===
" EasyAlign
" ===
vmap <LEADER>a <Plug>(EasyAlign)
nmap <LEADER>a <Plug>(EasyAlign)

" ===
" floaterm
" ===
command! Lf FloatermNew lf
command! Fzf FloatermNew fzf
nnoremap <leader>fo :Lf<cr>
nnoremap <leader>ff :Fzf<cr>

" ===
" FunctionList
" ===
nnoremap <M-w> :Vista!!<CR>
let g:vista_default_executive = 'coc'
autocmd FileType vista,vista_kind nnoremap <buffer> <silent>
      \ f :<C-u>call vista#finder#fzf#Run()<CR>

" ===
" Git
" ===
let g:gitgutter_map_keys = 0

" ===
" IndentLine
" ===
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_char = '│'
" let g:indentLine_first_char = '│'

" ===
" Json
" ===
let g:vim_json_syntax_conceal = 0

" ===
" Markdown
" ===
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" ===
" Muliple Cursors
" ===
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = ''
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" ===
" Status line
" ===
let g:airline_powerline_fonts = 1
set laststatus=2

" ===
" Switch
" ===
let g:switch_mapping = 'sw'
let g:switch_custom_definitions = [
      \ ['0', '1'],
      \ ['+', '-'],
      \ ]

" ===
" template
" ===
let g:tmpl_search_paths = [$CONFIG_DIR.'/templates']

" ===
" Undotree
" ===
let g:undotree_DiffAutoOpen = 0
nnoremap U :redo<CR>
noremap <M-e> :UndotreeToggle<CR>
