" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

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
call plug#end()
:map <F9> :NERDTreeToggle %<CR>
:map <F8> :NERDTreeFind<CR>

set number relativenumber
