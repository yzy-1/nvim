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
    exec "!chrome % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vim'
    exec "source %"
  endif
endfunc

function! BuildCode()
  exec "w"
  if &filetype == 'c'
    exec "AsyncRun gcc -std=c99 -Wall -g \"%\" -o \"%<\" -lm"
  elseif &filetype == 'cpp'
    exec "AsyncRun g++ -std=c++11 -Wall -g \"%\" -o \"%<\" -lm"
  endif
endfunc

nmap <LEADER>r :call RunCode()<CR>
nmap <LEADER>b :call BuildCode()<CR>
