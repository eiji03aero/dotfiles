function! JustAppend(string) abort
  execute "normal! mqA" . a:string . "\<esc>`q"
endfunction

function! JustTrimTail() abort
  execute "normal! mq$x`q"
endfunction

function! OmitDuplicateCharacter(character)
  return strpart(getline('.'), col('.')-1, 1) == a:character ? "\<Right>" : a:character
endfunction

function! OpenDoc()
  if &filetype ==# "go"
    execute ":GoDoc"
    return
  endif

  echo "error: OpenDoc: Ain't got nothing from current cursor"
endfunction

function! YankPathToClip ()
  echo "Yanked the path to clipboard: " expand('%:p')
  let @+ = expand('%:p')
endfunction

function! SplitWindowRight ()
  setlocal splitright
  vnew
  setlocal nosplitright
endfunction
