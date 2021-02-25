let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set termguicolors
filetype plugin on
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set tabstop=2
set shiftwidth=2
set expandtab
" Give more space for displaying messages.
""set cmdheigPht=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
syntax on

"auto sourcing when saving the file
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"Plugins
call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'tpope/vim-fugitive'
Plug 'gorodinskiy/vim-coloresque'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme codedark 
let g:rainbow_active = 1

"StatusLine
" Function: display errors from Ale in statusline
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

hi User1 ctermbg=blue ctermfg=red   guibg=blue guifg=lightcyan
hi User2 ctermbg=yellow   ctermfg=white  guibg=red guifg=yellow
hi User3 ctermbg=blue  ctermfg=green guibg=black guifg=white

set laststatus=2
set statusline=
set statusline+=\ %l\::\%c
set statusline+=\ %*
set statusline+=%2*\‹‹
set statusline+=\%f
set statusline+=%2*\››
set statusline+=%1*\%m
set statusline+=%1*\%{coc#status()}
set statusline+=%1*\%{StatusDiagnostic()}
set statusline+=%2*\ %{LinterStatus()}

let mapleader = " "
:map <leader>e :CocCommand explorer<CR>

set number relativenumber

"coc.nvim settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocFloating ctermbg=white
autocmd FileType json syntax match Comment +\/\/.\+$+

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

"fzf
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

"Vim-polyglot
"i3-config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
