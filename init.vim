let $VIMRC = $HOME . "/.config/nvim"

" Plugins ---------------------------------------------------------------
let plug=expand($VIMRC . '/autoload/plug.vim')
let noPlugInstalled = !filereadable(plug)
let plugInstalled = !noPlugInstalled

if noPlugInstalled
  silent execute '!curl -fLo '. plug .' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

  silent execute 'mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts && curl -fLo "Ubuntu Mono Nerd Font Complete.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf"

  " Install clojure-lsp
  " curl -s https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install | sudo bash'
endif
"------------------------------------------------------------------------

call plug#begin()
 " [Themes"]
 Plug 'ellisonleao/gruvbox.nvim' | Plug 'aonemd/quietlight.vim' | Plug 'NLKNguyen/papercolor-theme' | Plug 'overcache/NeoSolarized'
 
 " [Configurations]
 Plug 'neovim/nvim-lspconfig' " LSP configuration
 Plug 'williamboman/mason-lspconfig.nvim'
 Plug 'tpope/vim-sensible' " Sensible defaults
 Plug 'folke/which-key.nvim' " Finding key maps like doom emacs does

 " [Mappings]
 Plug 'tpope/vim-repeat' " Sensible repeats

 " [Text-objects]
 Plug 'tpope/vim-endwise' " Auto pairs
 Plug 'tpope/vim-abolish' " Search & replace abbrvs, coercion
 Plug 'tpope/vim-surround' | Plug 'tpope/vim-ragtag' " Brackets, parentheses, quotes
 Plug 'tpope/vim-unimpaired' " Work & move with brackets
 Plug 'tpope/vim-commentary' " Comments

 " [Shells]
 Plug 'tpope/vim-fugitive' " Git (:GCommit etc)
 Plug 'tpope/vim-dispatch' " Async tasks

 " [Buffer]
 Plug 'tpope/vim-sleuth' " Adjust shifts & tabs based on file
 Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' } " Easily see matching bracket pairs
 Plug 'echasnovski/mini.indentscope' | Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.20.8' } " Indent guidelines
 Plug 'ap/vim-css-color' " Colour highlighing
 Plug 'RRethy/vim-illuminate' " Highight current word under cursor
 Plug 'chrisgrieser/nvim-early-retirement' " Unload unused buffers

 " [Marks]
 Plug 'chentoast/marks.nvim' " Easier marks

 " [Gutters]
 Plug 'lewis6991/gitsigns.nvim' " Git signs

 " [Statusline]
 Plug 'nvim-lualine/lualine.nvim'

 " [Files, Fuzzy Finding]
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
 Plug 'nvim-neo-tree/neo-tree.nvim' | Plug 'MunifTanjim/nui.nvim' | Plug 'nvim-tree/nvim-web-devicons' | Plug 'nvim-lua/plenary.nvim' " Neotree
 Plug 'easymotion/vim-easymotion'

 " [LSP]
 Plug 'neoclide/coc.nvim', { 'branch': 'release' }
 Plug 'nvim-treesitter/nvim-treesitter' " Treesitter (syntax parsing)
 Plug 'liquidz/vim-iced', { 'for': 'clojure' } | Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'} | Plug 'guns/vim-sexp'
 Plug 'Olical/aniseed', { 'for': 'fennel' }
 Plug 'Olical/conjure', { 'for': 'fennel' }

 " [Syntax]
  Plug 'jwalton512/vim-blade', { 'for': 'php' }
  Plug 'peitalin/vim-jsx-typescript', { 'for': 'ts' }
  Plug 'stephenway/postcss.vim', { 'for': ['vue', 'css', 'sass', 'scss'] }
  Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }
  Plug 'instant-markdown/vim-instant-markdown', { 'for': 'markdown', 'do': 'yarn install' }
  Plug 'bakpakin/fennel.vim'
call plug#end()
