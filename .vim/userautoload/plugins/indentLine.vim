let g:indentLine_color_term = 237

" So that we can show quotes in json but still showing indentline
autocmd FileType json,jsonc syntax match jsonString /".*"/ conceal
autocmd FileType json,jsonc syntax clear jsonString
