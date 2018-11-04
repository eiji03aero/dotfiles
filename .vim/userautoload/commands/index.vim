command! InsertHoge call InsertHoge()
function! InsertHoge() abort
  let first = "h"
  let body = "og"
  let last = "e"
  execute ":normal a" . first . body . last
endfunction

function! JustAppend(string) abort
  execute "normal! mqA" . a:string . "\<esc>`q"
endfunction

function! JustTrimTail() abort
  execute "normal! mq$x`q"
endfunction
