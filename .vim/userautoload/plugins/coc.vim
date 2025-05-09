let g:coc_global_extensions = [
 \ 'coc-git',
 \ 'coc-snippets',
 \ 'coc-tsserver',
 \ 'coc-flow',
 \ 'coc-eslint',
 \ 'coc-prettier',
 \ 'coc-styled-components',
 \ 'coc-css',
 \ 'coc-html',
 \ 'coc-phpls',
 \ 'coc-clangd',
 \ 'coc-angular',
 \ 'coc-cmake',
 \ 'coc-go',
 \ 'coc-omnisharp',
 \ 'coc-rust-analyzer',
 \ 'coc-flutter',
 \ ]

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  autocmd BufWritePre *.go :silent! call CocAction('runCommand', 'editor.action.organizeImport')
augroup end
