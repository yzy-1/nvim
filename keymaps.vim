" 定义 <LEADER> 键
let mapleader=' '

" 保存 & 退出
nnoremap <C-q> :wqa<CR>

" 缩进
nnoremap < <<
nnoremap > >>

" 搜索
noremap - Nzz
noremap = nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap # *zz
noremap <C-#> #zz

" 使用 <LEADER><Space> 选中一个单词
nnoremap <LEADER><Space> viw
vnoremap <Space> iw

" 跳转到下一个单词
noremap N be
noremap n e

" 快速移动
noremap H b
noremap J 5j
noremap K 5k
noremap L w

" 使用 * 和 ^ 移动到行首/行尾
noremap * ^
noremap ^ 0

" 删除 keymap
noremap Q <nop>
noremap b <nop>
noremap m <nop>
noremap ' <nop>
vnoremap x <nop>

" 使用 <LEADER>w + hjkl 移动窗口
nnoremap <LEADER>wh <C-w>h
nnoremap <LEADER>wj <C-w>j
nnoremap <LEADER>wk <C-w>k
nnoremap <LEADER>wl <C-w>l

nnoremap <LEADER>wH <C-w>H
nnoremap <LEADER>wJ <C-w>J
nnoremap <LEADER>wK <C-w>K
nnoremap <LEADER>wL <C-w>L

" 分屏
nnoremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap sj :set splitbelow<CR>:split<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap sl :set splitright<CR>:vsplit<CR>

" 改变窗口大小
nnoremap <C-k> :res +5<CR>
nnoremap <C-j> :res -5<CR>
nnoremap <C-h> :vertical resize-5<CR>
nnoremap <C-l> :vertical resize+5<CR>

" 移动到上个/下个 Tab
nnoremap <C-e> :-tabnext<CR>
nnoremap <C-r> :+tabnext<CR>

" 跳转光标历史记录
noremap <C-i> <C-o>
noremap <C-o> <C-i>

" 跳转到上个/下个错误
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gE <Plug>(coc-diagnostic-prev)

" 跳转 definition/reference
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" 打开命令行
noremap ; :

" 在当前行上/下插入新行
inoremap <S-CR> <ESC>o
inoremap <C-CR> <ESC>O

" 切换到 Terminal-Normal mode
tnoremap <C-n> <C-\><C-n>

" 自增/自减光标下的数字
nnoremap _ <C-x>
nnoremap + <C-a>

" 快速打开 vimrc
nnoremap <leader>fe :e $MYVIMRC<cr>
