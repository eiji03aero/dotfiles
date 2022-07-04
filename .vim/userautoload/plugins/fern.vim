let g:fern#default_hidden=1

function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> s     <Plug>(fern-action-open:side)
  nmap <silent> <buffer> r     <Plug>(fern-action-reload)
  nmap <silent> <buffer> ma     <Plug>(fern-action-new-path)
  nmap <silent> <buffer> mm     <Plug>(fern-action-move)
  nmap <silent> <buffer> md     <Plug>(fern-action-remove)
  unmap <silent> <buffer> N
  unmap <silent> <buffer> K

  " nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  " nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  " nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

function! s:on_highlight() abort
  " Use brighter highlight on root node
  highlight link FernRootSymbol Title
  highlight link FernRootText   Title
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
  autocmd User FernHighlight call s:on_highlight()
augroup END

" function! s:fernHighlight(extension, fg, bg)
"   exec 'autocmd filetype fern highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg
"   exec 'autocmd filetype fern syntax match ' . a:extension . ' /' . a:extension . '/'
" endfunction
" 
" call s:fernHighlight('json',       '208',          'none')
" call s:fernHighlight('md',         '248',          'none')
" call s:fernHighlight('sh',         '248',          'none')
" call s:fernHighlight('go',         '248',          'none')
" call s:fernHighlight('cpp',        '248',          'none')
" call s:fernHighlight('cc',         '248',          'none')
" call s:fernHighlight('vim',        '248',          'none')
" call s:fernHighlight('Dockerfile', '248',          'non5')
" call s:fernHighlight('lock',       '248',          'none')
" call s:fernHighlight('toml',       '248',          'none')

" call s:fernHighlight('hs',         '208',          'none')
" call s:fernHighlight('kt',         '208',          'none')
" call s:fernHighlight('coffee',     '208',          'none')
" call s:fernHighlight('ts',         '208',          'none')
" call s:fernHighlight('tsx',        '208',          'none')
" call s:fernHighlight('json',       '208',          'none')
" call s:fernHighlight('css',        '208',          'none')
" 
" call s:fernHighlight('html',       'white',        'none')
" 
" call s:fernHighlight('styl',       'blue',         'none')
" call s:fernHighlight('sql',        'blue',         'none')
" 
" call s:fernHighlight('md',         'blue',         'none')
" call s:fernHighlight('dart',       'blue',         'none')
" call s:fernHighlight('py',         'blue',         'none')
" 
" call s:fernHighlight('yml',        'yellow',       'none')
" call s:fernHighlight('config',     'yellow',       'none')
" call s:fernHighlight('conf',       'yellow',       'none')
" call s:fernHighlight('js',         'yellow',       'none')
" call s:fernHighlight('jsx',        'yellow',       'none')
" call s:fernHighlight('h',          'yellow',       'none')
" 
" call s:fernHighlight('png',        'lightyellow',  'none')
" call s:fernHighlight('jpg',        'lightyellow',  'none')
" call s:fernHighlight('svg',        'lightyellow',  'none')
" 
" call s:fernHighlight('slim',       'red',          'none')
" call s:fernHighlight('rb',         'red',          'none')
" 
" call s:fernHighlight('scss',       'lightmagenta', 'none')
" 
" call s:fernHighlight('vue',        'green',        'none')
" 
" call s:fernHighlight('php',        'magenta',      'none')
