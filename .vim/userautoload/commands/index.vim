function! InsertHoge() abort
  let first = "h"
  let body = "og"
  let last = "e"
  execute ":normal a" . first . body . last
endfunction

command! InsertHoge call InsertHoge()
