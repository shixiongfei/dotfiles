set nocompatible                          " This must be first, because it changes other options
filetype off
let mapleader = "\<Space>"                " Set Leader Key

" Note: install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Load vim-plug
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'               " improved syntax highlighting for various languages
Plug 'wojciechkepka/vim-github-dark'      " Github Dark Theme
Plug 'itchyny/lightline.vim'              " Status Line
Plug 'ctrlpvim/ctrlp.vim'                 " Ctrl+P
Plug 'tpope/vim-pathogen'                 " Pathogen
Plug 'luochen1990/rainbow'                " RainBow Parentheses
Plug 'bhurlow/vim-parinfer'               " parinfer
Plug 'cohama/lexima.vim'                  " Auto close parentheses

" PlugInstall [name ...] [#threads]       Install plugins
" PlugUpdate [name ...] [#threads]        Install or update plugins
" PlugClean[!]                            Remove unused directories (bang
" version will clean without prompt)
" PlugUpgrade                             Upgrade vim-plug itself
" PlugStatus                              Check the status of plugins
" PlugDiff                                Examine changes from the previous
" update and the pending changes
" PlugSnapshot[!] [output path]           Generate script for restoring the
" current snapshot of the plugins

call plug#end()

set t_Co=256
set background=dark

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif

let base16colorspace = 256                " Access colors present in 256 colorspace

" setting for github dark theme & lightline
colorscheme ghdark
let g:gh_color = "soft"

let g:lightline = {
  \ 'colorscheme': 'one',
  \ }

" setting for VIM
execute pathogen#infect()
syntax enable                             " syntax highlighting
syntax on                                 " syntax highlighting
filetype on
filetype plugin indent on                 " required!
set laststatus=2
set fileencoding=utf-8
set fileencodings=utf-8,gbk
set termencoding=utf-8
set encoding=utf-8
set history=100                           " keep 100 lines of history
set ruler                                 " show the cursor position
set hlsearch                              " highlight the last searched term
set backspace=indent,eol,start            " Allow backspaceing over autoindent, line breaks, starts of insert
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
set numberwidth=5                         " Width of the line number column
set scrolloff=3
set nobackup
set nowb
set noswapfile

" Key Map
nnoremap <Leader>w :w<CR>

" RainBow Parentheses
let g:rainbow_active = 1

" Syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

