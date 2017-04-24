" Vundle settings
" =============================================
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Custom Settings
" ==============================================

" Enable syntax highlighting
syntax on

" Color scheme
colorscheme jellybeans

" Leader commands
" =============================================
" Leader
let mapleader = "\<Space>"

" Split edit your vimrc
nmap <leader>vrc :tabnew $MYVIMRC<cr> 
" Source current file
nmap <leader>sop :source %<cr> 

" Note: in order to remap C-s, you need to disable flow control
" Map Ctrl-s to write the file
nmap <C-s> :w<cr>
imap <C-s> <esc>:w<cr>
map <C-t> <esc>:tabnew<cr>
map <C-x> <C-w>c

" Move between wrapped lines, rather than jumping over wrapped segments
nmap j gj
nmap k gk

" Easy jump to beginning of line
nmap 0 ^ 

" Use C-Space to Esc out of any mode
nnoremap <C-Space> <esc>:noh<cr>
vnoremap <C-Space> <esc>gV
onoremap <C-Space> <esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <esc>
" Terminal sees <C-@> as <C-Space>
nnoremap <C-@> <esc>:noh<cr>
vnoremap <C-@> <esc>gV
onoremap <C-@> <esc>
cnoremap <C-@> <C-c>
inoremap <C-@> <esc>

" Numbers
set number
set numberwidth=5

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom
set splitbelow
set splitright

set hidden " Allow buffer to change w/o saving
set scrolloff=4 " Keep at least 4 lines below cursor
set lazyredraw " Don't update while executing macro
set backspace=indent,eol,start " Sane backspace behavior
