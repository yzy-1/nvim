" markdown
autocmd Filetype markdown nnoremap ,, /<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,, <ESC>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,b **** <++><ESC>F*hi
autocmd Filetype markdown inoremap ,d ~~~~ <++><ESC>F~hi
autocmd Filetype markdown inoremap ,i ** <++><ESC>F*i
autocmd Filetype markdown inoremap ,c `` <++><ESC>F`i
autocmd Filetype markdown inoremap ,C ```<CR><++><CR>```<CR><CR><++><ESC>4kA
autocmd Filetype markdown inoremap ,p ![](<++>) <++><ESC>F[a
autocmd Filetype markdown inoremap ,l [](<++>) <++><ESC>F[a
autocmd Filetype markdown inoremap ,# #<Space><Enter><++><ESC>kA
autocmd Filetype markdown inoremap ,@ ##<Space><Enter><++><ESC>kA
autocmd Filetype markdown inoremap ,< ###<Space><Enter><++><ESC>kA
autocmd Filetype markdown inoremap ,> ####<Space><Enter><++><ESC>kA
