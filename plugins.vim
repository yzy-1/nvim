call plug#begin('~/.config/nvim/plugged')

" Asyncrun
Plug 'skywind3000/asyncrun.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Comment
Plug 'tpope/vim-commentary'

" AutoPairs
Plug 'jiangmiao/auto-pairs'

" Coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Textobj-user
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'

" Start screen
Plug 'mhinz/vim-startify'

" Status line
Plug 'theniceboy/eleline.vim'

" Color scheme
Plug 'morhetz/gruvbox'

" InsentLine
Plug 'Yggdroot/indentLine'

" Cursor word
Plug 'itchyny/vim-cursorword'

" Vim-surround
Plug 'tpope/vim-surround'

" Function list
Plug 'liuchengxu/vista.vim'

" Undotree
Plug 'mbbill/undotree'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug 'iamcco/markdown-preview.vim'
" Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & cyarn install'  }

" C/C++
Plug 'yzy-1/vim-cpp-enhanced-highlight'

" Switch
Plug 'AndrewRadev/switch.vim'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }

" Easy motion
Plug 'easymotion/vim-easymotion'

" Search
Plug 'brooth/far.vim'

" Peekaboo
Plug 'junegunn/vim-peekaboo'

" Formatter
Plug 'Chiel92/vim-autoformat'

" Auto sudo
Plug 'lambdalisue/suda.vim'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Easy Align
Plug 'junegunn/vim-easy-align'

call plug#end()

source $CONFIG_DIR/plugins-config.vim
