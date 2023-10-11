let $BAT_THEME='Solarized (light)'

" Solarized
let g:solarized_italic_comments=v:true
let g:solarized_italic_keywords=v:true
let g:solarized_italic_functions=v:true
let g:solarized_italic_variables=v:true

" Clojure
let g:iced_enable_default_key_mappings=v:true
let g:iced_default_key_mapping_leader='<localleader>'

" Easy motion
let g:Easymotion_do_mapping=0
let g:EasyMotion_smartcase=1
let g:EasyMotion_startofline=0

" Markdown
let g:instant_markdown_autostart=1
let g:instant_markdown_autoscroll=1
let g:instant_markdown_mermaid=1

" Coc
let g:coc_global_extensions = ["@yaegassy/coc-tailwindcss3", "coc-tsserver", "coc-vetur", "coc-eslint", "coc-clojure", "coc-markdownlint", "coc-html", "coc-tsserver", "coc-elixir", "coc-erlang_ls", "coc-json"]
let g:coc_user_config = {
  \ "coc.source.iced.enable": "true",
  \ "coc.preferences.formatOnType": "true",
  \ "coc.preferences.formatOnSaveFiletypes": ["vue", "typescript", "javascript", "php", "clojure"],
  \ "eslint.autoFixOnSave": "true",
  \ "codeLens.enable": "true",
  \ "colors.enable": "true",
  \ "diagnostic.checkCurrentLine": "true",
  \ "diagnostic.virtualText": "true",
  \ "diagnostic.virtualTextCurrentLineOnly": "false",
  \ "diagnostic.enableMessage": "jump",
\}
highlight CocFloating ctermbg=black ctermfg=white
highlight CocErrorFloat ctermbg=black ctermfg=white
highlight CocWarningFloat ctermbg=black ctermfg=white
highlight CocVirtualText ctermbg=black ctermfg=white
highlight CocErrorVirtualText ctermbg=black ctermfg=white
highlight CocWarningVirtualText ctermbg=black ctermfg=white


set updatetime=500
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
