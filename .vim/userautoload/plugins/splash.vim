let s:script_path = expand('<sfile>:p:h')
let g:splash#path = substitute(s:script_path, "userautoload\/plugins", "splash/vim_intro.txt", "")
