let $MYVIMRC_DIR = "~/.config/nvim"

" Key mappings & settings will be relative to their plugins
let mapleader = ','
let maplocalleader= 'g'

" Plugins ---------------------------------------------------------------
let plug=expand($MYVIMRC_DIR . '/autoload/plug.vim')
let noPlugInstalled = !filereadable(plug)
let plugInstalled = !noPlugInstalled

if noPlugInstalled
  silent execute '!curl -fLo '. plug .' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

  " Install clojure-lsp
  " curl -s https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install | sudo bash'
endif

call plug#begin()
  " Start
  Plug 'mhinz/vim-startify'

  " Themes
  Plug 'ellisonleao/gruvbox.nvim'

  " UI improvements
  Plug 'ap/vim-css-color'
  Plug 'chentoast/marks.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'junegunn/rainbow_parentheses.vim'
  augroup rainbow_lisp
    autocmd!
    autocmd FileType clojure,lisp,scheme RainbowParentheses
    augroup END
    let g:rainbow#max_level = 30
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'RRethy/vim-illuminate'
  Plug 'folke/lsp-colors.nvim'
  Plug 'echasnovski/mini.indentscope'
  Plug 'folke/todo-comments.nvim'

  " Workflow
  Plug 'easymotion/vim-easymotion'
    map <localleader> <plug>(easymotion-prefix)
    let g:EasyMotion_smartcase=1
    let g:EasyMotion_startofline=0
    map <localleader>l <plug>(easymotion-lineforward)
    map <localleader>j <plug>(easymotion-j)
    map <localleader>k <plug>(easymotion-k)
    map <localleader>h <plug>(easymotion-linebackward)
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
    let $BAT_THEME = 'OneHalfLight'
    nnoremap <leader>p :Files<cr>
    nnoremap <leader>b :Buffers<cr>
    nnoremap <leader>gf :Rg<cr>
    nnoremap <leader>bf :BLines<cr>
    nnoremap <leader>af :Lines<cr>
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
    let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], ['readonly', 'filename']],
      \   'right': [['gitbranch', 'modified']],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
    \ }
  Plug 'tpope/vim-commentary'
  Plug 'folke/which-key.nvim'
  Plug 'chrisgrieser/nvim-early-retirement'
        
  " Languages & sytnax
  Plug 'jwalton512/vim-blade', { 'for': 'php' }
  Plug 'peitalin/vim-jsx-typescript', { 'for': 'ts' }
  Plug 'stephenway/postcss.vim', { 'for': ['vue', 'css', 'sass', 'scss'] }
  Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    function! ShowDocumentation()
      if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
        silent call CocActionAsync('definitionHover')
      endif
    endfunction
    inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"
    inoremap <silent><expr> <tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#refresh()
    inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<c-h>"
    inoremap <silent><expr> <c-space> coc#refresh()
    nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> rn <Plug>(coc-rename)
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-prev)
    nmap <leader>cl <Plug>(coc-codelens-action)
    nmap <leader>f :call CocActionAsync('format')<cr>
    nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
    nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
    nnoremap <silent> K :call ShowDocumentation()<cr>
    nnoremap <silent><leader>d :call CocAction('diagnosticInfo')<cr>
    let g:coc_global_extensions = ["@yaegassy/coc-tailwindcss3", "coc-tsserver", "coc-vetur", "coc-eslint", "coc-clojure", "coc-markdownlint", "coc-html", "coc-tsserver", "coc-elixir", "coc-erlang_ls", "coc-json"]
    let g:coc_user_config = {
      \ "coc.source.iced.enable": "true",
      \ "eslint.autoFixOnSave": "true",
      \ "codeLens.enable": "true",
      \ "colors.enable": "true",
      \ "diagnostic.checkCurrentLine": "true",
      \ "diagnostic.virtualText": "true",
      \ "diagnostic.virtualTextCurrentLineOnly": "false",
      \ "diagnostic.enableMessage": "jump",
    \}
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd BufWritePre *.ts,*.js,*.tsx,*.js,*.cljs,*.clj,*.php :silent call CocAction('runCommand', 'editor.action.organizeImport')
  Plug 'liquidz/vim-iced', { 'for': 'clojure'  } | Plug 'guns/vim-sexp'
    let g:iced_enable_default_key_mappings = v:true
  Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
  Plug 'mattn/emmet-vim'
    let g:user_emmet_install_global=1 
call plug#end()

" Key mappings ---------------------------------------------------------
nnoremap <leader>w :w<cr>

nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>q :bd<cr>
nnoremap <leader>b :ls<cr>:b<space>

nnoremap <leader>tt :tabe<cr>
nnoremap <leader>tn :tabn<cr>
nnoremap <leader>tp :tabp<cr>

imap kj <esc>

nnoremap <space> zo
nnoremap <BS> zc

nnoremap <leader>hs :split<cr>
nnoremap <leader>vs :vsplit<cr>

nnoremap <leader>\ :Explore<cr>

nnoremap <leader><space> :noh<cr>
nnoremap <leader>' :term<cr>
tnoremap <leader>c <c-\><c-n><cr> 

vnoremap <tab> >><cr>
vnoremap <s-tab> <<<cr>

" Settings -------------------------------------------------------------
syntax enable

filetype plugin indent on
filetype indent on
set mouse=a
set scrolloff=999
set updatetime=250
set hidden
set nobackup
set noautochdir
set writebackup
set cmdheight=2
set signcolumn=yes
set encoding=utf-8
set number relativenumber
set cursorline
set showmatch
set filetype=on
set tabstop=2
set foldmethod=syntax
set foldlevel=999
autocmd Filetype javascript,typescript,vue,css,elixir,erlang,haskell,clojure setlocal tabstop=2
autocmd Filetype php setlocal tabstop=4
autocmd Filetype text setlocal tabstop=2
set shiftwidth=0
set softtabstop=0
set expandtab
set autoindent
set copyindent
set completeopt=menu,menuone,noselect,preview
set nowrap
set termguicolors
set shell=zsh
set background=light
set clipboard=unnamedplus
silent! colorscheme gruvbox

if plugInstalled
  lua require('gitsigns').setup()
  lua require('marks').setup()
  lua require('which-key').setup()
  lua require('indent_blankline').setup()
  lua require('mini.indentscope').setup({ draw = { delay = 200 }, options = { try_as_border = true }, symbol = '│'})
  lua require("early-retirement").setup() 
endif
