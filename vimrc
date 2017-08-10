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

Plugin 'tpope/vim-rails'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdtree'
Plugin 'tomlion/vim-solidity'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Custom Settings
" ==============================================

" Enable syntax highlighting
syntax on

" Color scheme
colorscheme jellybeans

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Leader commands
" =============================================
" Leader
let mapleader = "\<Space>"

" Split edit your vimrc
nmap <leader>vrc :tabnew $MYVIMRC<cr> 
" Source current file
nmap <leader>sop :source %<cr> 
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Note: in order to remap C-s, you need to disable flow control
" Map Ctrl-s to write the file
nmap <C-s> :w<cr>
imap <C-s> <esc>:w<cr>
map <C-t> <esc>:tabnew<cr>
map <C-x> <C-w>c

" Map Ctrl-q to quit file
nmap <C-q> :q<cr>

" Move between wrapped lines, rather than jumping over wrapped segments
nmap j gj
nmap k gk

" Easy jump to beginning of line
nmap 0 ^ 

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

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

" Set autoindenting
set autoindent

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
set backspace=2
set history=500
set nobackup
set nowritebackup
set ruler " show cursor position at all times
set showcmd " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
" Remove swap files
set noswapfile

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <leader>e :e <C-R>=expand("%:p:h") . "/" <cr>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <leader>te :tabe <C-R>=expand("%:p:h") . "/" <cr>

" Nerdtree
" open automatically when vim starts up
" autocmd vimenter * NERDTree

" Jsx syntax
let g:jsx_ext_required=0
