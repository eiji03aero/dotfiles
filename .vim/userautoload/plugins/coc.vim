let g:coc_global_extensions = [
  \ 'coc-git',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-ccls'
  \ ]

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
