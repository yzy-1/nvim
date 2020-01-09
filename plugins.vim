call plug#begin('~/.config/nvim/plugged')

" Asyncrun
Plug 'skywind3000/asyncrun.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

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
Plug 'vim-airline/vim-airline'

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
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" C/C++
Plug 'yzy-1/vim-cpp-enhanced-highlight'

" Switch
Plug 'AndrewRadev/switch.vim'

" Json
Plug 'elzr/vim-json'

" Easy motion
Plug 'easymotion/vim-easymotion'

" Search
Plug 'brooth/far.vim'

" Peekaboo
Plug 'junegunn/vim-peekaboo'
call plug#end()

source $CONFIG_DIR/plugins-config.vim
