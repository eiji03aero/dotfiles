" let g:typescript_indent_disable = 1
augroup typescript_vim
  autocmd!
  autocmd BufRead,BufRead *.ts setlocal omnifunc=
  autocmd BufRead,BufRead *.tsx setlocal omnifunc=
augroup END
