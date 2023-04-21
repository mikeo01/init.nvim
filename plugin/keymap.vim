noremap <SPACE> <nop>
let mapleader = "\<Space>"
let maplocalleader= ','

nnoremap <Esc><Esc> :noh<CR>

" [Buffers]
nnoremap <leader>w :w<CR>
nnoremap <leader>fs :w<CR>

" [Tabs]
nnoremap <S-C-left> :tabp<CR>
nnoremap <S-C-right> :tabn<CR>
nnoremap <S-C-down> :tabe<CR>
nnoremap <S-C-up> :tabc<CR>

" [Text]
nnoremap <C-a> Gvgg
vnoremap <TAB> >><CR>
vnoremap <S-TAB> <<<CR>

" [Window management]
nnoremap <S-k> :above split<CR>
nnoremap <S-j> :below split<CR>
nnoremap <S-h> :vs<CR>
nnoremap <S-l> :botright vs<CR>
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-up> :res -1<CR>
nnoremap <C-down> :res +1<CR>
nnoremap <C-right> <C-W>> +<CR>
nnoremap <C-left> <C-W>< -<CR>
nnoremap <leader>wd :q<CR>

" [Terminal]
nnoremap <leader>ot :term<CR>
tnoremap <localleader>c <C-\><C-n><CR>

" [Files, Fuzzy Finding]
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>. :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>m :Marks<CR>
nnoremap ? :BLines<CR>
nnoremap M :Maps<CR>
nnoremap \ :Neotree filesystem reveal left toggle<CR>
nmap s <Plug>(easymotion-s)
nmap <leader>j <PLug>(easymotion-j)
nmap <leader>k <PLug>(easymotion-k)
map ¬ <Plug>(easymotion-prefix) " Do nothing

" [LSP]
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
nnoremap <silent> <space>k :call ShowDocumentation()<cr>
nnoremap <silent><leader>d :call CocAction('diagnosticInfo')<cr>
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufWritePre *.ts,*.js,*.tsx,*.js,*.cljs,*.clj,*.php :silent call CocAction('runCommand', 'editor.action.organizeImport')

