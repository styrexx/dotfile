"plug-vim
" tyme & setup of neovim
set number
set relativenumber 
set tabstop=2
set shiftwidth=2
set autoindent 
set smarttab
set softtabstop=2
set mouse=a
set nohlsearch
set scrolloff=8
set signcolumn=yes
set omnifunc=htmlcomplete#CompleteTags
set nowrap
set cursorline
set colorcolumn=80

" vim-plugin to install 
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin()

 Plug 'https://github.com/vim-airline/vim-airline' "Status Bar
 Plug 'https://github.com/preservim/nerdtree' "NERDtree
 Plug 'https://github.com/tpope/vim-commentary' "Commentary plaug gcc & gc
 Plug 'https://github.com/ap/vim-css-color' 
 Plug 'https://github.com/preservim/tagbar' "TagbarTog
 Plug 'https://github.com/junegunn/fzf.vim' "search ingen in fyle
 Plug 'https://github.com/neoclide/coc.nvim' 
 Plug 'https://github.com/gruvbox-community/gruvbox' "theme color
 Plug 'https://github.com/mattn/emmet-vim' "emmet-vim-pluging
 Plug 'https://github.com/jiangmiao/auto-pairs' "bracket ato comlite
 Plug 'https://github.com/xiyaowong/nvim-transparent' "transparent
 Plug 'https://github.com/tpope/vim-surround' 
 Plug 'https://github.com/turbio/bracey.vim' "live server bracey after installing go to plugin/bracey.vim and '$ npm install --prefix server' 

call plug#end()

:colorscheme gruvbox


" " use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()


"transparent
let g:transparent_enabled = v:true 

" key controle 
" nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
"" nnoremap <C-f> :NERDTreeFind<CR>

" Install & clean PLUGIo
nnoremap <C-i> :PlugInstall<CR>
nnoremap <C-l> :PlugClean<CR>
" nnoremap <C-b> :TagbarToggle<CR>

" html straction key
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" search in vim 
" nnoremap <C-s> :Ag<CR>
"
nnoremap <C-a> :Bracey<CR>
nnoremap <C-x> :BraceyStop<CR>

" some remap
nnoremap n nzz
nnoremap N Nzz
nnoremap<C-b> <C-b>zz
nnoremap<C-d> <C-d>zz

" to copy and past
vnoremap <C-c> "+y

" move in the tabs
nnoremap <C-t>h :tabNext<CR>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t>o :tabnew 

" selection 
vnoremap J :m'>+1<CR>gv'
vnoremap K :m'<-2<CR>gv'
