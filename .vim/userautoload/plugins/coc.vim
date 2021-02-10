let g:coc_global_extensions = [
 \ 'coc-git',
 \ 'coc-snippets',
 \ 'coc-tsserver',
 \ 'coc-flow',
 \ 'coc-eslint',
 \ 'coc-prettier',
 \ 'coc-json',
 \ 'coc-css',
 \ 'coc-html',
 \ 'coc-phpls',
 \ 'coc-clangd',
 \ 'coc-angular',
 \ 'coc-cmake',
 \ 'coc-go',
 \ ]

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  autocmd BufWritePre *.go :silent! call CocAction('runCommand', 'editor.action.organizeImport')
augroup end
