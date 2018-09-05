"----------------------------------------
" Custom config
"----------------------------------------
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
packadd termdebug
"----------------------------------------
" Custom Functions
"----------------------------------------
function! YankPathToClip ()
  echo "Yanked the path to clipboard: " expand('%:p')
  let @+ = expand('%:p')
endfunction

function! s:bufnew()
  if &buftype == "terminal" && &filetype == ""
    set filetype=terminal
  endif
endfunction

function! s:filetype()
endfunction

function! s:open(args) abort
  if empty(term_list())
    execute "terminal" a:args
  else
    let bufnr = term_list()[0]
    execute term_getsize(bufnr)[0] . "new"
    execute "buffer + " bufnr
  endif
endfunction

command! -nargs=*
\   Terminal call s:open(<q-args>)

augroup my-terminal
  autocmd!
  autocmd BufNew * call timer_start(0, { -> s:bufnew() })
  autocmd FileType terminal call s:filetype()
augroup END
"----------------------------------------
" Custom AutoGroups
"----------------------------------------
augroup custom_augroup
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
  " autocmd VimEnter * execute 'NERDTree'
  autocmd FilterWritePre * if &diff | setlocal wrap< | endif
  autocmd FileType vim setlocal foldmethod=indent
  " autocmd BufRead,BufNewFile *.es6 setfiletype javascript
augroup END
