set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

if v:version >= 704
    Plugin 'SirVer/ultisnips'
endif

Plugin 'bling/vim-airline'
Plugin 'benmills/vimux'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'mattn/emmet-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/django.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'

call vundle#end()

" Settings

syntax enable
filetype plugin indent on
set relativenumber
set hlsearch

" Plugin config

set tags=./tags;$HOME

" - airline
set t_Co=256
let g:airline_theme='raven'
let g:airline_right_sep=''
let g:airline_left_sep=''
set fillchars+=vert:\ 

" - moustache

let g:mustache_abbreviations = 1

" - python-mode
set completeopt=menu

" - syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['cuda', 'python'] }
let g:syntastic_cpp_include_dirs=['include', 'hdr', 'inc', '../include', '../hdr', '../inc', '/opt/cuda/include']
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_c_include_dirs=['include', 'hdr', 'inc', '../include', '../hdr', '../inc', '/opt/cuda/include']

" - UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
let g:UltiSnipsSnippetsDir='~/.vim/snipps'

" Mappgings

let mapleader=','

nnoremap <leader>w :w <CR>
nnoremap <leader>x :x <CR>
nnoremap <leader>nh :nohlsearch <CR>
nnoremap <leader>nu :set invnumber <CR>
nnoremap <leader>nt :NERDTreeToggle <CR>
nnoremap Y y$

inoremap jj <ESC>
inoremap kk <ESC>
inoremap jk <ESC>

nnoremap <leader>ft :! python -m behave <CR>

nnoremap <leader>ev :e ~/.vimrc <CR>
nnoremap <leader>sv :so ~/.vimrc <CR>

" Indent settings

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

" Wild stuff
set suffixes+=.a,.o,.pyc
set wildignore+=*.o,*.so
set wildignore+=*/bower_components/*,*/node_modules/*,*/dist/*,*/.tmp*,*/tmp*,*/build/*

" Statusline
set laststatus=2

" Extra per project configuration
if $PWD != $HOME
    if filereadable('.vimrc')
        source .vimrc
    endif
endif

" Vimux
nnoremap <leader>vr :VimuxRunCommand("
nnoremap <leader>vl :VimuxRunLastCommand<CR>
nnoremap <leader>vi :VimuxInspectRunner<CR>
nnoremap <leader>vc :VimuxCloseRunner<CR>
