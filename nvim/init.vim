set nocompatible
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
set clipboard=unnamedplus
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
" set cmdheigPht=
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
syntax on
"auto sourcing when saving the file
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"Plugins
call plug#begin()
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'pineapplegiant/spaceduck'
Plug 'tomasiser/vim-code-dark'
Plug 'editorconfig/editorconfig-vim'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'tpope/vim-fugitive'
Plug 'gorodinskiy/vim-coloresque'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'ycm-core/YouCompleteMe'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme spaceduck 
let g:rainbow_active = 1

"StatusLine
" Function: display errors from Ale in statusline
function! LinterStatus() abort
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
"set statusline+=%1*\%{coc#status()}
set statusline+=%1*\%{StatusDiagnostic()}
"set statusline+=%2*\ %{LinterStatus()}
let mapleader = " "
:map <leader>e :NERDTreeToggle<CR>
set number relativenumber

"coc.nvim settings
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" autocmd CursorHold * silent call CocActionAsync('highlight')
" highlight CocFloating ctermbg=white
" autocmd FileType json syntax match Comment +\/\/.\+$+
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<CR>"
" " Use <c-space> to trigger completion.
" if has('nvim')
  " :verbose inoremap <silent><expr> <c-space> coc#refresh()
" else
  " inoremap <silent><expr> <c-@> coc#refresh()
" endif
" Shorten error/warning flags
" I have some custom icons for errors and warnings but feel free to change them.
" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
"Vim-polyglot

"i3-config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
"Ctrl-p
:map <leader>f :CtrlP<CR>
set number relativenumber

"coc.nvim settings
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" autocmd CursorHold * silent call CocActionAsync('highlight')
" highlight CocFloating ctermbg=white
" autocmd FileType json syntax match Comment +\/\/.\+$+

:map <leader>x :ALEFix<CR>
" :map <F2> :ALERename<CR>

"i3-config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"Nerd Commentor
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"CtrlP speedup
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']

let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1


"YCM Config
:map <leader>i :YcmCompleter OrganizeImports <CR>
:map <leader>y :YcmCompleter FixIt <CR>
:map <leader>r :YcmCompleter RefactorRename <CR>
