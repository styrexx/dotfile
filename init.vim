"plug-vim
" tyme & setup of neovim
:set number
:set relativenumber 
:set autoindent 
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set nohlsearch
:set scrolloff=8
:set signcolumn=yes
:set omnifunc=htmlcomplete#CompleteTags
:set nowrap

call plug#begin()

 Plug 'https://github.com/vim-airline/vim-airline' "Status Bar
 Plug 'https://github.com/preservim/nerdtree' "NERDtree
 Plug 'https://github.com/tpope/vim-commentary' "Commentary plaug gcc & gc
 Plug 'https://github.com/ap/vim-css-color' 
 Plug 'https://github.com/preservim/tagbar' "TagbarTog
 Plug 'https://github.com/junegunn/fzf.vim' "search ingen in fyle
 " Plug 'https://github.com/neoclide/coc.nvim' 
 Plug 'https://github.com/gruvbox-community/gruvbox' "theme color
 Plug 'https://github.com/mattn/emmet-vim' "emmet-vim-pluging
 Plug 'https://github.com/jiangmiao/auto-pairs' "bracket ato comlite
 Plug 'https://github.com/xiyaowong/nvim-transparent' "transparent

call plug#end()

:colorscheme gruvbox

"transparent
let g:transparent_enabled = v:true 

" key controle 
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"" nnoremap <C-f> :NERDTreeFind<CR>

" Install & clean PLUGIN
nnoremap <C-i> :PlugInstall<CR>
nnoremap <C-l> :PlugClean<CR>
"
nnoremap <C-b> :TagbarToggle<CR>

" html straction key
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" search in vim 
nnoremap <C-s> :Ag<CR>
