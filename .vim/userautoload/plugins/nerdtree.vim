let g:NERDTreeShowBookmarks=0
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 45
let g:NERDTreeCascadeSingleChildDir = 0

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('sh',         '250',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('go',         '250',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('cpp',        '250',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('vim',        '250',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('Dockerfile', '250',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('lock',       '250',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('toml',       '250',          'none', 'yellow',  '#151515')

call NERDTreeHighlightFile('hs',         '208',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('kt',         '208',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('coffee',     '208',          'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts',         '208',          'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('tsx',        '208',          'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('json',       '208',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('css',        '208',          'none', 'cyan',    '#151515')

call NERDTreeHighlightFile('html',       'white',        'none', 'yellow',  '#151515')

call NERDTreeHighlightFile('styl',       'blue',         'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('sql',        'blue',         'none', 'cyan',    '#151515')

call NERDTreeHighlightFile('md',         'blue',     'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('dart',       'blue',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py',         'blue',       'none', 'yellow',  '#151515')

call NERDTreeHighlightFile('yml',        'yellow',       'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config',     'yellow',       'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',       'yellow',       'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('js',         'yellow',       'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx',        'yellow',       'none', '#ffa500', '#151515')

call NERDTreeHighlightFile('png',        'lightyellow',  'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('jpg',        'lightyellow',  'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('svg',        'lightyellow',  'none', '#ff00ff', '#151515')

call NERDTreeHighlightFile('slim',       'red',          'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('rb',         'red',          'none', 'red',     '#151515')

call NERDTreeHighlightFile('scss',       'lightmagenta', 'none', 'cyan',    '#151515')

call NERDTreeHighlightFile('vue',        'green',        'none', '#ffa500', '#151515')

call NERDTreeHighlightFile('php',        'magenta',      'none', '#ff00ff', '#151515')
