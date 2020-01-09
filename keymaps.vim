let mapleader=' '

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap - Nzz
noremap = nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap # *zz
noremap 1 #zz

" Use <lEADER><Space> to select one word
nnoremap <LEADER><Space> viw
vnoremap <Space> iw

" Goto next word
noremap N b
noremap n e

" Move one screen
noremap J <C-f>
noremap K <C-b>

" Fast move keymap
noremap H b
noremap L w

" Use * jump to line start (instead of ^)
noremap * ^
noremap ^ 0

" Remove keymap
noremap Q <nop>
noremap b <nop>
nnoremap t <nop>

" Use <LEADER> + hjkl keys for moving the cursor around windows
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l

nnoremap <LEADER>H <C-w>H
nnoremap <LEADER>J <C-w>J
nnoremap <LEADER>K <C-w>K
nnoremap <LEADER>L <C-w>L

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
nnoremap tj :+tabnext<CR>
nnoremap tk :-tabnext<CR>

" Move cursor to last position
noremap <C-i> <C-o>
noremap <C-o> <C-i>

" Goto next/prev diagnostic
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gE <Plug>(coc-diagnostic-prev)

" Goto definition/reference
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

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

" Make a new line then paste
nnoremap <C-p> o<ESC>p^

" Increase and decrease number
nnoremap _ <C-x>
nnoremap + <C-a>

" Copy to system clipboard
vnoremap Y "+y

