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
  echo "Yanked the path to clipboard: ".expand('%:p')
  let @+ = expand('%:p')
endfunction

function! YankFileNameToClip ()
  echo "Yanked the file name to clipboard: ".expand('%:t')
  let @+ = expand('%:t')
endfunction

function! YankCurrentBranchToClip ()
  let name = FugitiveHead()
  echo "Yanked the current branch name to clipboard: ".name
  let @+ = name
endfunction

function! SplitWindowRight ()
  setlocal splitright
  vnew
  setlocal nosplitright
endfunction

function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()

function! ProfileCursorMove() abort
  let date_str = strftime('%Y%m%d')
  let time_str = strftime('%H%M%S')
  let directory_name = expand('~/dotfiles/logs/vim-profile' . '/' . date_str)
  let file_name = strftime(time_str . '.log')
  let g:profile_file = expand(directory_name . '/' . file_name)

  call mkdir(directory_name, 'p')
  execute 'redir > ' . g:profile_file
  redir END

  normal! gg
  normal! zR

  execute 'profile start ' . g:profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(100)
    call feedkeys('j')
  endfor
endfunction

function! ProfileStart() abort
  profile start ./perf
  profile func *
  profile file *
endfunction

function! s:fzf_directory()
  call fzf#run({
        \ 'source': 'find ' . getcwd() . ' -type d',
        \ 'down': '40%',
        \ 'sink':   'e',
        \ 'options': ['-x', '--algo=v2', '--preview', 'ls -G {}'],
        \})
endfunction

command! Directories call s:fzf_directory()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! GlobalReplace() abort
  " args ./**
  " argdo %s/domo/kore/gce
  let targetGlob = input('target glob (eg ./*.ts): ')
  execute 'args ' . targetGlob

  let replaceSub = input('replace substitution(eg. domo/kore/gce: ')
  execute 'argdo %s/' . replaceSub
endfunction

" -------------------- git --------------------
function! GitConflictResolveFst() abort
  call SearchTo("<<<<")
  normal! dd
  call SearchTo("====")
  normal! V
  call SearchTo(">>>>")
  normal! dd
endfunction

function! GitConflictResolveSnd() abort
  call SearchTo("<<<<")
  normal! V
  call SearchTo("====")
  normal! dd
  call SearchTo(">>>>")
  normal! dd
endfunction

function! GitConflictShow()
  call SearchTo("<<<<")
endfunction

" -------------------- utils --------------------
function! SearchTo(str)
  execute "normal! /" . a:str . "\<cr>"
endfunction

function! ShowHighlights()
  redir => m | silent highlight | redir END | enew | put=m
endfunction

function! RefreshDeinCache()
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endfunction

function! OpenURLUnderCursor() abort
  let url = expand('<cWORD>')
  if (url == '')
    echoerr 'OpenURLUnderCursor: word not found under cursor'
    return
  endif

  execute ':!open '.url
endfunction

function! CreateGitBranchNote()
  let repository_path = fnamemodify(FugitiveGitDir(), ':h')
  let repository_name = fnamemodify(repository_path, ':t')
  let git_branch = FugitiveHead()
  call quick_notes#new_by_path(repository_name . '/' . git_branch . '.md')
endfunction
