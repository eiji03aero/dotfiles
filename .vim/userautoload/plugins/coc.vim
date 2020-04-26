let g:coc_global_extensions = [
  \ 'coc-git',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-flow',
  \ 'coc-eslint',
  \ 'coc-tslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-phpls'
  \ ]

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " autocmd BufNew,BufEnter *.go execute "silent! CocDisable"
  " autocmd BufLeave *.go execute "silent! CocEnable"
augroup end
