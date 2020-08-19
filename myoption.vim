set nocompatible

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "
" Remap leader key to ,
let g:mapleader=' '

" Don't show last command
set noshowcmd

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" === TAB/Space settings === "
" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler


" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread


" Enable true color support
set termguicolors

" Vim airline theme
let g:airline_theme='cool'

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set floating window to be slightly transparent
if has('nvim')
  set winbl=10
endif


if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/
set undodir=~/.vim/.undo/


set wildmode=longest:full
set mouse=a

set showmode
set mouse=a
set encoding=utf-8
syntax on
filetype plugin indent on

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set relativenumber
set number
set cursorline
set textwidth=80
set wrap
set linebreak
set wrapmargin=2
set scrolloff=5
set sidescrolloff=15
set laststatus=2
set ruler
set hidden

set showmatch
set hlsearch
set ignorecase
set smartcase

set spell spelllang=en_us

set noautochdir
set noerrorbells
set visualbell
set history=1000
set autoread
set listchars=tab:»■,trail:■
set list

set autowrite
set incsearch

set signcolumn=yes
set updatetime=300
set cmdheight=2


" Changing cursor shape per mode
if has('nvim')
  let $TERM = 'iterm2'
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
        \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
        \,sm:block-blinkwait175-blinkoff150-blinkon175
else
  " t_SI Start Insert mode
  " t_SR Start Replace mode
  " t_EI End Insert or replace mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


