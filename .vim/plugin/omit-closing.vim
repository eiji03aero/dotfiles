" let s:closings = [')', '}', ']', "'", '"', '`']
"
" function! s:acquireCharacterUnderCursor()
"   return matchstr(getline('.'), '\%'.col('.').'c.')
" endfunction
"
" function! s:clearTypedCharacter()
"   v:char = ''
" endfunction
"
" function! s:duplicateInputDetector(targetCharacter, characterUnderCursor)
"   return a:targetCharacter ==# v:char && a:targetCharacter ==# a:characterUnderCursor
" endfunction
"
" function! s:watchOmitClosing()
"   let l:characterUnderCursor = s:acquireCharacterUnderCursor()
"
"   for char in s:closings
"     if s:duplicateInputDetector(char, l:characterUnderCursor)
"       let v:char = ""
"       execute "\<Right>"
"     endif
"   endfor
" endfunction
"
" augroup doumo_custom
"   autocmd!
"   autocmd InsertCharPre * call s:watchOmitClosing()
" augroup END
