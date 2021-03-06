let g:user_emmet_mode = 'iv'
let g:user_emmet_splitjointag_key = '<c-e>j'
let g:user_emmet_expandabbr_key = '<c-e>e'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
  \ 'variables': {
  \   'lang' : 'ja',
  \ },
  \ 'html' : {
  \   'filters':     'html',
  \   'indentation': '  ',
  \ },
  \ 'css' : {
  \   'filters':     'fc',
  \   'indentation': '  ',
  \ },
  \ 'javascript.jsx': {
  \   "extends":     'jsx',
  \   "indentation": '  ',
  \ },
  \ 'php' : {
  \   'extends':     'html',
  \   'filters':     'html',
  \   'indentation': '  ',
  \ },
  \ 'erb' : {
  \   'expands':     'html',
  \   'filters':     'html',
  \   'indentation': '  ',
  \ }
  \}
augroup EmmetVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = ' '[:&tabstop]
augroup END
