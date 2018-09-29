let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#disable_auto_complete = 1

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

let s:neco_dicts_dir = $HOME . '/.vim/dicts'
if isdirectory(s:neco_dicts_dir)
  let g:neocomplete#sources#dictionary#dictionaries = {
  \   'ruby': s:neco_dicts_dir . '/ruby.dict',
  \   'javascript': s:neco_dicts_dir . '/react.dict,' .
  \                 s:neco_dicts_dir . '/javascript.dict,' .
  \                 s:neco_dicts_dir . '/esnext.dict',
  \ }
endif

let g:neocomplete#delimiter_patterns = {
\    'javascript': ['.'],
\    'ruby':       ['::']
\}

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
