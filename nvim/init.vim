" TextEdit might fail if hidden is not set.
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set termguicolors
filetype plugin on
colorscheme pablo 
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set tabstop=3
set shiftwidth=3
set expandtab
" Give more space for displaying messages.
""set cmdheigPht=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
syntax on
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'gorodinskiy/vim-coloresque'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'dense-analysis/ale'
Plug 'uiiaoo/java-syntax.vim'
call plug#end()
let mapleader = " "
:map <leader>n :NERDTreeToggle %<CR>
:map <leader>m :NERDTreeFind <CR>

set number relativenumber
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocFloating ctermbg=white
hi Pmenu guibg=black
hi Pmenu guifg=cyan

"ale fixers
let g:ale_fixers = {'java':['uncrustify']}
let g:ale_fix_on_save = 1

" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
