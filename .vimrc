set nocompatible            " This must be first, because it changes other options
let mapleader="\<Space>"    " Set Leader Key

" Load vim-plug
call plug#begin('~/.vim/plugged')

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'epeli/slimux'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'bhurlow/vim-parinfer'
Plug 'hzchirs/vim-material'
Plug 'othree/yajs.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'tpope/vim-pathogen'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'
Plug 'elixir-editors/vim-elixir'

filetype plugin indent on   " required!
call plug#end()

" PlugInstall [name ...] [#threads]     Install plugins
" PlugUpdate [name ...] [#threads]      Install or update plugins
" PlugClean[!]                          Remove unused directories (bang version will clean without prompt)
" PlugUpgrade                           Upgrade vim-plug itself
" PlugStatus                            Check the status of plugins
" PlugDiff                              Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]         Generate script for restoring the current snapshot of the plugins

set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:syntastic_javascript_checkers = ['eslint']

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

colorscheme vim-material
let g:airline_theme='material'

nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <Leader>w :w<CR>   " write file
nnoremap <Leader>q :q<CR>   " quit vim
nnoremap <Leader>wq :wq<CR> " write & quit
nnoremap <Leader>n :bn<CR>  " airline tabline next
nnoremap <Leader>v :bp<CR>  " airline tabline prev

nmap <Leader>p "+gp     " Past from clipboard
vmap <Leader>y "+y      " Copy to clipboard

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1   " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)

let g:slimux_tmux_path = 'tmux'
let g:slimux_select_from_current_window = 1
let g:slimux_pane_format = '#{pane_id}:'
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

syntax on               " syntax highlighting

set encoding=utf-8
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
set hlsearch            " highlight the last searched term
set backspace=indent,eol,start  " Allow backspaceing over autoindent, line breaks, starts of insert
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set smartindent
set showmatch
set number
set numberwidth=4       " Width of the line number column

set nobackup
set nowb
set noswapfile

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

