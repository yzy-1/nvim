" 缩进
nnoremap < <<
nnoremap > >>

" 搜索
noremap - Nzz
noremap = nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap ' *zz
noremap <C-'> #zz

" 使用 <LEADER><Space> 选中一个单词
nnoremap <LEADER><Space> viw
vnoremap <Space> iw

" 跳转到下一个单词
noremap N be
noremap n e

" 快速移动
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l

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

" 跳转光标历史记录
noremap <C-i> <C-o>
noremap <C-o> <C-i>

" 打开命令行
noremap ; :

" 自增/自减光标下的数字
nnoremap _ <C-x>
nnoremap + <C-a>

nnoremap U <c-r>
nmap <leader>c gcc
vmap <leader>c gc
