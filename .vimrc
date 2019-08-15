set nocompatible                        " This must be first, because it changes other options
filetype off
let mapleader = "\<Space>"              " Set Leader Key

" Note: install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Load vim-plug
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'             " improved syntax highlighting for various languages
Plug 'joshdick/onedark.vim'             " Atom One Dark Theme
Plug 'itchyny/lightline.vim'            " Status Line
Plug 'ctrlpvim/ctrlp.vim'               " Ctrl+P
Plug 'tpope/vim-pathogen'               " Pathogen
Plug 'scrooloose/syntastic'             " Syntax checking
Plug 'scrooloose/nerdtree'              " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'      " NerdTree Git
Plug 'luochen1990/rainbow'              " RainBow Parentheses
Plug 'bhurlow/vim-parinfer'             " parinfer
Plug 'cohama/lexima.vim'                " Auto close parentheses
Plug 'SirVer/ultisnips'                 " The ultimate snippet solution for Vim
Plug 'honza/vim-snippets'               " snippets
Plug 'jpalardy/vim-slime'               " Slime for VIM
Plug 'xavierd/clang_complete'           " C/C++
Plug 'pangloss/vim-javascript'          " Javascript
Plug 'davidhalter/jedi-vim'             " Python
Plug 'vim-ruby/vim-ruby'                " Ruby

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

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif

let base16colorspace = 256              " Access colors present in 256 colorspace

" setting for one dark theme & lightline
colorscheme onedark
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" setting for VIM
execute pathogen#infect()
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

" Key Map
nnoremap <Leader>w :w<CR>

" NerdTree & NerdTree Git
nnoremap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" RainBow Parentheses
let g:rainbow_active = 1

" Syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name":"default", "target_pane":"{right-of}"}
let g:slime_dont_ask_default = 1
let g:slime_paste_file = "$HOME/.slime_paste"

" C/C++ (智能提示：任意模式<C-x><C-u> 或 插入模式<C-n>)
let g:clang_auto_select = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1
let g:clang_complete_copen = 1
"let g:clang_periodic_quickfix = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_use_library = 1
let g:clang_library_path = '/usr/local/opt/llvm/lib'

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 8cb75dff415bf9523ae2b04b51cee3b7 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/shixiongfei/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
