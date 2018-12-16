let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.go = '\h\w\.\w*'

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
\    'ruby':       ['::'],
\    'go': ['.'],
\}

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
