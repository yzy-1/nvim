call plug#begin('~/.config/nvim/plugged')

" ===
" 辅助插件
" ===
Plug 'airblade/vim-gitgutter'       " 显示 git diff 状态
Plug 'jiangmiao/auto-pairs'         " 括号自动补全
Plug 'mhinz/vim-startify'           " 显示一个开始屏幕
Plug 'theniceboy/eleline.vim'       " 状态栏
Plug 'Yggdroot/indentLine'          " 缩进线
Plug 'tpope/vim-surround'           " 提供 `成对编辑` 功能
Plug 'AndrewRadev/switch.vim'       " 反转 true / false
Plug 'lambdalisue/suda.vim'         " 自动 sudo
Plug 'terryma/vim-multiple-cursors' " 多光标编辑

" ===
" 功能插件
" ===
Plug 'skywind3000/asyncrun.vim'                   " 异步运行代码
Plug 'tpope/vim-fugitive'                         " 集成 git 操作
Plug 'junegunn/gv.vim'                            " 查看 git 提交历史
Plug 'tpope/vim-commentary'                       " 一键注释
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " LSP 功能支持
Plug 'liuchengxu/vista.vim'                       " 函数列表
Plug 'mbbill/undotree'                            " 撤销历史树
Plug 'easymotion/vim-easymotion'                  " 一键跳转
Plug 'brooth/far.vim'                             " 全局搜索
Plug 'Chiel92/vim-autoformat'                     " 代码格式化
Plug 'junegunn/vim-easy-align'                    " 一键对齐
Plug 'junegunn/fzf.vim'                           " FZF

" ===
" 语言插件
" ===

" C/C++
Plug 'yzy-1/vim-cpp-enhanced-highlight'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & cyarn install'  }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript',
      \ { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js',
      \ { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }

" CSharp
" Plug 'OmniSharp/omnisharp-vim'

call plug#end()

source $CONFIG_DIR/plugins-config.vim
