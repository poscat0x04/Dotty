set conceallevel=2
set concealcursor=c

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set mouse=a
set nu
set nocompatible
set showcmd
set showmode
set nobackup
set nowritebackup

lua require('packer-nvim')

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-e> <Esc>$a

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

syntax on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:lightline = {
  \ 'colorscheme': 'onehalfdark',
  \ }

imap <S-Insert> <C-R>*
set clipboard+=unnamedplus

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" && !&readonly| NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERD Tree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm=0
let mapleader = "\\"
let maplocalleader = ","
