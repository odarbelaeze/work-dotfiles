set nocompatible
filetype off

call plug#begin('~/.vim/bundle')

if v:version >= 704
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif

" Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'kien/ctrlp.vim'
Plug 'klen/python-mode'
Plug 'lepture/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/django.vim'

call plug#end()

" Settings

syntax enable
filetype plugin indent on
" set background=dark
" colorscheme solarized

" Numbers

set number
set relativenumber
set hlsearch

" Plug config

set tags=./tags;$HOME

" - airline
set t_Co=256
let g:airline_theme='serene'
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
" I need to configure this better so that it does not collide with
" vim-snippets
" let g:UltiSnipsSnippetsDir='~/.vim/snipps'

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

" Ember specific mappings
cnoreabbrev eg !ember g

" Indent settings

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

" Wild stuff
set suffixes+=.a,.o,.pyc
set wildignore+=*.o,*.so
set wildignore+=*/bower_components/*,*/node_modules/*,*/dist/*,*/.tmp*,*/tmp*,*/build/*,*/__pycache__/*,*/venv/*

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
