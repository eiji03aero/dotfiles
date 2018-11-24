function! JustAppend(string) abort
  execute "normal! mqA" . a:string . "\<esc>`q"
endfunction

function! JustTrimTail() abort
  execute "normal! mq$x`q"
endfunction
