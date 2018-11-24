function! OpenDoc()
  if &filetype ==# "go"
    execute ":GoDoc"
    return
  endif

  echo "error: OpenDoc: Ain't got nothing from current cursor"
endfunction
