" TextEdit might fail if hidden is not set.
colorscheme darkblue
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set tabstop=2
set shiftwidth=3 
" Give more space for displaying messages.
""set cmdheigPht=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

syntax on

call plug#begin()

Plug 'andrewle/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'gorodinskiy/vim-coloresque'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'luochen1990/rainbow'
Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()
:map <F9> :NERDTreeToggle %<CR>
:map <F8> :NERDTreeFind<CR>

set number relativenumber
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
