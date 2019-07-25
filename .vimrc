set nocompatible                        " This must be first, because it changes other options
filetype off
let mapleader="\<Space>"                " Set Leader Key

" Note: install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Load vim-plug
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'             " improved syntax highlighting for various languages
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" PlugInstall [name ...] [#threads]     Install plugins
" PlugUpdate [name ...] [#threads]      Install or update plugins
" PlugClean[!]                          Remove unused directories (bang
" version will clean without prompt)
" PlugUpgrade                           Upgrade vim-plug itself
" PlugStatus                            Check the status of plugins
" PlugDiff                              Examine changes from the previous
" update and the pending changes
" PlugSnapshot[!] [output path]         Generate script for restoring the
" current snapshot of the plugins

call plug#end()

set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256                " Access colors present in 256 colorspace

" setting for one dark theme & lightline
colorscheme onedark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" setting for VIM
syntax enable                           " syntax highlighting
syntax on                               " syntax highlighting
filetype on
filetype plugin indent on               " required!
set laststatus=2
set fileencoding=utf-8
set fileencodings=utf-8,gbk
set termencoding=utf-8
set encoding=utf-8
set history=100                         " keep 100 lines of history
set ruler                               " show the cursor position
set hlsearch                            " highlight the last searched term
set backspace=indent,eol,start          " Allow backspaceing over autoindent, line breaks, starts of insert
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cindent
set smartindent
set showmatch
set textwidth=80
set colorcolumn=+1
set number
set numberwidth=5                       " Width of the line number column
set scrolloff=3
set nobackup
set nowb
set noswapfile

