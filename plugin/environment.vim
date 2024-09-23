let $BAT_THEME='Solarized (light)'

" Solarized
let g:solarized_italic_comments=v:true
let g:solarized_italic_keywords=v:true
let g:solarized_italic_functions=v:true
let g:solarized_italic_variables=v:true

" Easy motion
let g:Easymotion_do_mapping=0
let g:EasyMotion_smartcase=1
let g:EasyMotion_startofline=0

" Markdown
let g:instant_markdown_autostart=1
let g:instant_markdown_autoscroll=1
let g:instant_markdown_mermaid=1

" Coc
let g:coc_global_extensions = ["@yaegassy/coc-tailwindcss3", "coc-vetur", "coc-eslint", "coc-prettier", "coc-markdownlint", "coc-html", "coc-tsserver", "coc-json", "coc-conjure"]
highlight CocFloating ctermbg=black ctermfg=white
highlight CocErrorFloat ctermbg=black ctermfg=white
highlight CocWarningFloat ctermbg=black ctermfg=white
highlight CocVirtualText ctermbg=black ctermfg=white
highlight CocErrorVirtualText ctermbg=black ctermfg=white
highlight CocWarningVirtualText ctermbg=black ctermfg=white

" Conjure
let g:conjure#filetype#fennel = "conjure.client.fennel.stdio"
let g:conjure#client#fennel#stdio#command = "love ."


set updatetime=1000
set tabstop=2
set nowrap
set copyindent
set autoindent
set expandtab
set shiftwidth=0
set softtabstop=0
set cursorcolumn
set cursorline
set relativenumber
set signcolumn=number
set foldmethod=syntax
set foldlevel=999
set background=light
set clipboard=unnamedplus
set termguicolors
set mouse=a
silent! colorscheme NeoSolarized
