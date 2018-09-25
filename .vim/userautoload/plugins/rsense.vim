let g:acp_enableAtStartup = 0
augroup my_rsense
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END
let g:rsenseHome = expand("/Users/eijiosakabe/.rbenv/shims/rsense")
let g:rsenseUseOmniFunc = 1
