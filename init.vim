let mapleader=" "

source ~/.config/nvim/snippets.vim
source ~/.config/nvim/runcode.vim

" === System ===
set nocompatible
set mouse=a
set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,gb18030,gbk,cp936
set fileencodings=utf-8,ucs-bom,chinese
set clipboard=unnamedplus
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" Prevent incorrect backgroung rendering
let &t_ut=''

" === Main code display ===
syntax enable
syntax on
set number
set cursorline
set noshowmode
set ruler
set wrap
set novisualbell
set showmatch
set showcmd
set wildmenu
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=syntax
set foldlevel=99
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set laststatus=2
set autochdir

" === Editor behavior ===
" Auto indent
set autoindent
set smartindent
set cindent
function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
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
set listchars+=trail:·         " │ Use custom symbols to
" set listchars+=eol:↴           " │ represent invisible characters.
set listchars+=nbsp:_          " ┘

" Search config
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" Restore cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" === Keymaps ===

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap - Nzz
noremap = nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap # *zz
noremap 1 #zz

" Goto next word
noremap n w
noremap N b

" Fast move keymap
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l

" Remove keymap
map Q <nop>
map b <nop>
map t <nop>
map s <nop>
map . <nop>

" Use <LEADER> + hjkl keys for moving the cursor around windows
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

noremap <LEADER>H <C-w>H
noremap <LEADER>J <C-w>J
noremap <LEADER>K <C-w>K
noremap <LEADER>L <C-w>L

" Split the screens to up (horizontal), down (horizontal)
" Left (vertical), right (vertical)
nnoremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap sj :set splitbelow<CR>:split<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <UP> :res +5<CR>
noremap <DOWN> :res -5<CR>
noremap <LEFT> :vertical resize-5<CR>
noremap <RIGHT> :vertical resize+5<CR>

" Tab keymap
nnoremap te :tabe<Space>
noremap tj :+tabnext<CR>
noremap tk :-tabnext<CR>

" Buffer keymap
" noremap bk :bp<CR>
" noremap bj :bn<CR>

" Move cursor to last position
noremap <C-i> <C-o>
noremap <C-o> <C-i>

" " Goto definition
" noremap gd <C-]>zz

" Press ` to switch latter case (instead of ~)
noremap ` ~

" Command line (instead of :)
noremap ; :

" Insert a new line under the cursor line
inoremap <S-CR> <ESC>o
inoremap <C-CR> <ESC>O

" Go to Terminal-Normal mode
tnoremap <ESC><ESC> <C-\><C-n>

" Source or edit vimrc
nnoremap e <nop>
nnoremap src :source $MYVIMRC<CR>
nnoremap erc :tabe $MYVIMRC<CR>

" === Auto fcitx ===
function! Fcitx2En()
 let s:input_status = system("fcitx-remote")
 if s:input_status == 2
  let l:b = system("xmodmap ~/.Xmodmap-en")
  let l:a = system("fcitx-remote -c")
 endif
endfunction

set nottimeout
autocmd InsertLeave * call Fcitx2En()

" === Plugins ===
call plug#begin('~/.config/nvim/plugged')

" Asyncrun
Plug 'skywind3000/asyncrun.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" Comment
Plug 'tpope/vim-commentary'

" Auto-pairs
Plug 'jiangmiao/auto-pairs'

" Coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Formater
Plug 'sbdchd/neoformat'

" Textobj-user
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'

" Start screen
Plug 'mhinz/vim-startify'

" Tags
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'

" Airline
Plug 'vim-airline/vim-airline'

" Colorscheme
"Plug 'rakr/vim-one'

" InsentLine
Plug 'Yggdroot/indentLine'

" Cursor word
Plug 'itchyny/vim-cursorword'

" Vim-surround
Plug 'tpope/vim-surround'

" LeaderF
Plug 'Yggdroot/LeaderF'
" Plug 'ctrlpvim/ctrlp.vim'

" File manager
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'
else
  Plug 'Shougo/defx.nvim'
  Plug 'kristijanhusak/defx-icons'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Undotree
Plug 'mbbill/undotree'

" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" C/Cpp
Plug 'bfrg/vim-cpp-modern'

" Switch
Plug 'AndrewRadev/switch.vim'

" Emment-vim
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mattn/webapi-vim'

" Hex color preview
Plug 'chrisbra/Colorizer'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'elzr/vim-json'

" Easy motion
Plug 'easymotion/vim-easymotion'

call plug#end()

" === Plugin settings ===

" Asyncrun
" 自动打开 quickfix window ，高度为 10
let g:asyncrun_open = 10
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 wq 打开/关闭 Quickfix 窗口
nnoremap wq :call asyncrun#quickfix_toggle(10)<CR>
nnoremap we :lopen<CR>
let g:asyncrun_stdin = 1

" Git
let g:gitgutter_map_keys = 0

" Comment
nmap <LEADER>c gcc
vmap <LEADER>c gc
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType csharp setlocal commentstring=//\ %s
autocmd FileType java setlocal commentstring=//\ %s
autocmd FileType go setlocal commentstring=//\ %s

" Coc
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
nmap rn <Plug>(coc-rename)

" Formater
noremap <LEADER>f :Neoformat<CR>
let g:neofotmat_enabled_lex = ['clang-format']

" Start screen
let g:startify_files_number = 8
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
" let g:startify_lists = [
"   \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
"   \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
"   \ { 'type': 'commands',  'header': ['   Commands']       },
"   \ ]
let g:startify_skiplist = [
  \ '^/tmp',
  \ ]
let g:startify_bookmarks = [
  \ '~/.vim/vimrc',
  \]
let g:startify_custom_header = [
  \ '   _____    _ _ _   _                               _               _',
  \ '  | ____|__| (_) |_(_)_ __   __ _    _____   _____ | |_   _____  __| |',
  \ '  |  _| / _` | | __| |  _ \ / _` |  / _ \ \ / / _ \| \ \ / / _ \/ _` |',
  \ '  | |__| (_| | | |_| | | | | (_| | |  __/\ V / (_) | |\ V /  __/ (_| |',
  \ '  |_____\__,_|_|\__|_|_| |_|\__, |  \___| \_/ \___/|_| \_/ \___|\__,_|',
  \ '                            |___/',
  \]
let g:startify_custom_footer = [
  \ '  Zer0 Studio - yzy1',
  \]

" Tags
set tags=./.tags;,.tags
" Gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
  silent! call mkdir(s:vim_tags, 'p')
endif

" Airline
let g:airline_powerline_fonts = 1

" Colorscheme
set termguicolors
set background=dark
let g:one_allow_italics = 1
colorscheme OnePro
let g:airline_theme='one'
hi CocErrorHighlight gui=undercurl guisp=red
hi CocWarningHighlight gui=undercurl guisp=green

" IndentLine
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'

" LeaderF
let g:Lf_ShortcutF = '<C-f>'
let g:Lf_ShortcutB = '<C-b>'
nnoremap <C-f> :LeaderfFunction!<CR>
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" File manager
" let g:ranger_map_keys = 0
" let g:ranger_replace_netrw = 1
" noremap wf :RangerWorkingDirectory<CR>
" let g:no_plugin_maps = 1
nnoremap <silent> wf
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用 l 打开文件
	nnoremap <silent><buffer><expr> l defx#do_action('multi', ['drop'])
	nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
endfunction

call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 35,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

autocmd FileType defx call s:defx_mappings()

" MarkdownPreview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
nnoremap tb :TableModeToggle<CR>

" Undotree
let g:undotree_DiffAutoOpen = 0
nnoremap U :redo<CR>
noremap wu :UndotreeToggle<CR>

" C/Cpp
" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1
let c_no_curly_error = 1

" Switch
let g:switch_mapping = "sw"

" Emment-vim
autocmd FileType html imap <expr><TAB> emmet#expandAbbrIntelligent("\<TAB>")
autocmd Filetype html imap ,, <ESC><C-y>n
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand("~/.config/nvim/EmmetSnippets.json")), "\n"))

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger=",,"

" Easy motion
let g:EasyMotion_do_mapping = 0
nmap ss <Plug>(easymotion-s2)
