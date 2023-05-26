let $BAT_THEME='gruvbox-light'

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
set signcolumn=yes
set foldmethod=syntax
set foldlevel=999
set background=light
set clipboard=unnamedplus
set termguicolors
set mouse=a
silent! colorscheme solarized
