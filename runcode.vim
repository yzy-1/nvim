function! RunCode()
  exec "w"
  exec "set splitbelow"
  if &filetype == 'c'
    exec "split"
    exec "res 10"
    exec "terminal ./%<"
    exec "normal i"
  elseif &filetype == 'cpp'
    exec "split"
    exec "res 10"
    exec "terminal ./%<"
    exec "normal i"
  elseif &filetype == 'python'
    exec "split"
    exec "res 10"
    exec "terminal python3 %"
    exec "normal i"
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "!chromium % &"
  elseif &filetype == 'vim'
    exec "source %"
  endif
endfunc

function! BuildCode()
  exec "w"
  if &filetype == 'c'
    exec "AsyncRun clang -std=c99 -g \"%\" -o \"%<\" -lm"
  elseif &filetype == 'cpp'
    exec "AsyncRun clang++ -std=c++11 -g \"%\" -o \"%<\""
  endif
endfunc

nmap <LEADER>r :call RunCode()<CR>
nmap <LEADER>b :call BuildCode()<CR>
