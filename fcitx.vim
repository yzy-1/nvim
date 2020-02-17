function! FcitxToEnglish()
  let s:input_status = system('fcitx-remote')
  if s:input_status == 2
    let l:_ = system('fcitx-remote -c')
  endif
endfunction

augroup Fcitx
  autocmd InsertLeave * call FcitxToEnglish()
augroup END
