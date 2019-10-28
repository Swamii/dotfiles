" Vundle plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'ayu-theme/ayu-vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'lifepillar/vim-solarized8'
Plugin 'kh3phr3n/python-syntax'
Plugin 'Yggdroot/indentLine'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()

" Colors
syntax enable           " enable syntax processing
set termguicolors
set background=light

colorscheme solarized8

" let ayucolor="light"
" colorscheme ayu

" Misc
set ttyfast                     " faster redraw
set backspace=indent,eol,start
set nocompatible
set clipboard=unnamed

" Spaces & Tabs
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent

" UI Layout
set number              " show line numbers
set showcmd             " show command in bottom bar
set wildmenu
set showmatch           " higlight matching parenthesis
set nocursorline        " Don't highlight the current line, toggled with autocmd below

" Searching
set ignorecase          " ignore case when searching
set smartcase           " be case sensitive when non lowercase
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

" AutoGroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb %s/\s\+$//e " Strip trailing whitespace
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.yaml setlocal tabstop=2
    autocmd BufEnter *.yaml setlocal shiftwidth=2
    autocmd BufEnter *.yaml setlocal softtabstop=2

    " Highlight line when in insert mode
    autocmd InsertEnter * set cursorline
    autocmd InsertLeave * set nocursorline
augroup END

" Key-Bindings
" Remove arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Buffer movement in insert mode
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <C-h> <Left>
inoremap <C-l> <Right>

:let mapleader = ","
:map <leader>y "0y
:map <leader>p "0p

" Backups
set backup
set backupdir=~/.vim/backups
set backupskip=/tmp/*,/private/tmp/*
set writebackup

" Swap & Undo
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" IndentLine
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0

