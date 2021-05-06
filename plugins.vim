call plug#begin('~/.config/nvim/plugged')

" ===
" 辅助插件
" ===
Plug 'airblade/vim-gitgutter'       " 显示 git diff 状态
Plug 'theniceboy/eleline.vim'       " 状态栏
Plug 'tpope/vim-surround'           " 提供 `成对编辑` 功能
Plug 'AndrewRadev/switch.vim'       " 反转 true / false
Plug 'lambdalisue/suda.vim'         " 自动 sudo
" Plug 'terryma/vim-multiple-cursors' " 多光标编辑
Plug 'ayu-theme/ayu-vim'            " 主题
Plug 'tibabit/vim-templates'        " 自动添加模板
Plug 'luochen1990/rainbow'          " 彩虹括号

" ===
" 功能插件
" ===
Plug 'skywind3000/asyncrun.vim'                   " 异步运行代码
Plug 'tpope/vim-commentary'                       " 一键注释
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " LSP 功能支持
Plug 'liuchengxu/vista.vim'                       " 函数列表
Plug 'mbbill/undotree'                            " 撤销历史树
Plug 'junegunn/vim-easy-align'                    " 一键对齐
Plug 'voldikss/vim-floaterm'                      " 浮动终端

" ===
" 语言插件
" ===

" C/C++
Plug 'yzy-1/vim-cpp-enhanced-highlight'
Plug 'yzy-1/vim-cpp-auto-include'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'

" Markdown
Plug 'dhruvasagar/vim-table-mode'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Go
Plug 'fatih/vim-go'

call plug#end()

source $CONFIG_DIR/plugins-config.vim
