
nmap <leader>f :silent !fnlfmt --fix %<cr>:e<cr>

"autocmd BufWritePost * silent! !fnlfmt --fix % | edit
