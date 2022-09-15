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
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment ctermfg=14
  autocmd ColorScheme nord highlight Folded ctermfg=12 cterm=NONE guifg=#586885
  autocmd ColorScheme nord highlight helpHyperTextJump guisp=#88C0D0
augroup END
colorscheme nord

let g:lightline = {
  \ 'colorscheme': 'nord',
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
