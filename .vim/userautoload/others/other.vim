"----------------------------------------
" Custom config
"----------------------------------------
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
"----------------------------------------
" Custom Functions
"----------------------------------------
function! YankPathToClip ()
  echo "Yanked the path to clipboard: " expand('%:p')
  let @+ = expand('%:p')
endfunction

" NERDTree custom function
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

function! OmitDuplicateCharacter(character)
  return strpart(getline('.'), col('.')-1, 1) == a:character ? "\<Right>" : a:character
endfunction
"----------------------------------------
" Custom AutoGroups
"----------------------------------------
augroup custom_augroup
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
  " autocmd VimEnter * execute 'NERDTree'
  autocmd FilterWritePre * if &diff | setlocal wrap< | endif
  autocmd FileType vim setlocal foldmethod=indent
augroup END
