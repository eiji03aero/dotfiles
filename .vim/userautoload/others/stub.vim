" " Terminal mode ----------------------------------------
" tnoremap <C-w>q <C-w>:quit!<CR>
" tnoremap <C-w>d <C-w>:hide<CR>
" tnoremap <Esc> <C-w><S-n>
" packadd termdebug
"
" function! s:bufnew()
"   if &buftype == "terminal" && &filetype == ""
"     set filetype=terminal
"   endif
" endfunction
"
" function! s:filetype()
" endfunction
"
" function! s:open(args) abort
"   if empty(term_list())
"     execute "terminal" a:args
"   else
"     let bufnr = term_list()[0]
"     execute term_getsize(bufnr)[0] . "new"
"     execute "buffer + " bufnr
"   endif
" endfunction
"
" command! -nargs=*
"\   Terminal call s:open(<q-args>)
"
" augroup my-terminal
"   autocmd!
"   autocmd BufNew * call timer_start(0, { -> s:bufnew() })
"   autocmd FileType terminal call s:filetype()
" augroup END
"
