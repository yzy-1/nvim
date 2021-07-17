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
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1

" ===
" Coc
" ===
let g:coc_global_extensions = [
			\ 'coc-python', 'coc-vimlsp', 'coc-yank', 'coc-go',
			\ 'coc-json', 'coc-clangd', 'coc-pairs', 'coc-highlight' ]
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

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm() :
			\ <SID>checkBackSpace() ? "\<TAB>" :
			\ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

function! s:checkBackSpace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~# '\s'
endfunction

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

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" ===
" Commenter
" ===
nmap <LEADER>c gcc
vmap <LEADER>c gc
autocmd FileType c,cpp,csharp,java,go setlocal commentstring=//\ %s

" ===
" EasyAlign
" ===
xmap <LEADER>a <Plug>(EasyAlign)
nmap <LEADER>a <Plug>(EasyAlign)
let g:easy_align_ignore_groups = []

" ===
" EditorConfig
" ===
au FileType gitcommit,text let b:EditorConfig_disable = 1

" ===
" floaterm
" ===
command! Lf FloatermNew lf
command! Fzf FloatermNew fzf
nnoremap <leader>fo :Lf<cr>
nnoremap <leader>ff :Fzf<cr>
let g:floaterm_opener='edit'

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
" Go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 0
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_code_completion_enabled = 0 " 使用 coc 补全
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_autosave = 1
let g:go_fmt_autosave = 0

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
" Rainbow
" ===
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['cyan', 'yellow', 'lightgreen', 'lightmagenta'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'contains_prefix': 'TOP',
\	'parentheses_options': '',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'ocaml': {
\			'parentheses': ['start=/(\ze[^*]/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\[|/ end=/|\]/ fold', 'start=/{/ end=/}/ fold'],
\		},
\		'tex': {
\			'parentheses_options': 'containedin=texDocZone',
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody,vimExecute',
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold'],
\		},
\		'xml': {
\			'syn_name_prefix': 'xmlRainbow',
\			'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
\		},
\		'xhtml': {
\			'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((script|style|area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'php': {
\			'syn_name_prefix': 'phpBlockRainbow',
\			'contains_prefix': '',
\			'parentheses': ['start=/(/ end=/)/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\[/ end=/\]/ containedin=@htmlPreproc contains=@phpClTop', 'start=/{/ end=/}/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold contains_prefix=TOP'],
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\		'sh': 0,
\	}
\}

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
" table-mode
" ===
let g:table_mode_corner='|'

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

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
