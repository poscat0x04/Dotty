call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'

Plug 'mileszs/ack.vim'

Plug 'itchyny/lightline.vim'

Plug 'satabin/hocon-vim'

Plug 'luochen1990/rainbow'

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

" generic config
set nu
set nocompatible
set mouse=a
set showcmd
set showmode

let g:rainbow_active = 1

syntax on
colorscheme onedark

" tab
set expandtab ts=2 sw=2 ai

" ripgrep
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Save last cursor position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" LSP Settings
set rtp+=~/.vim/pack/XXX/start/LanguageClient-neovim

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
