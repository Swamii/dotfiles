" Colors
syntax enable           " enable syntax processing
set background=light
let g:solarized_termtrans=0
colorscheme solarized

" Vundle plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()

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
