set nocompatible
filetype off

let g:python3_host_prog='~/.pyenv/versions/3.5.1/bin/python'

call plug#begin('~/.vim/bundle')

if v:version >= 704
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-sort-motion'
Plug 'davidhalter/jedi-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'hdima/python-syntax'
Plug 'justinj/vim-react-snippets'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'klen/python-mode'
Plug 'lepture/vim-jinja'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic' | Plug 'jaxbot/syntastic-react'
Plug 'sophacles/vim-bundle-mako'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
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
" set noswapfile " Cuz YOLO

" Numbers

set number
set relativenumber
set hlsearch

" Plug config

set tags=./tags;$HOME

" - airline

set t_Co=256
" Favorites: distinguished, ladreon, ubaryd
let g:airline_theme='ubaryd'
let g:airline_right_sep=''
let g:airline_left_sep=''
set fillchars+=vert:\ 

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#rigth_sep = ''
" let g:airline#extensions#tabline#left_sep = ''

" - Tmuxline

let g:tmuxline_powerline_separators = 0

" - python-mode
set completeopt=menu
let g:pymode_rope=0

" - syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['cuda', 'python'] }
let g:syntastic_cpp_include_dirs=['include', 'hdr', 'inc', '../include', '../hdr', '../inc', '/opt/cuda/include']
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_c_include_dirs=['include', 'hdr', 'inc', '../include', '../hdr', '../inc', '/opt/cuda/include']
let g:syntastic_javascript_checkers = ['eslint']

" - UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
" I need to configure this better so that it does not collide with
" vim-snippets
" let g:UltiSnipsSnippetsDir='~/.vim/snipps'
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips']

" The silver searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Mappgings

let mapleader=','

nnoremap <leader>w :w <CR>
nnoremap <leader>x :x <CR>
nnoremap <leader>nh :nohlsearch <CR>
nnoremap <leader>nu :set invnumber <CR>
nnoremap <leader>nt :NERDTreeToggle <CR>
nnoremap <leader>tt :TagbarToggle <CR>
nnoremap <leader>st :SyntasticToggleMode <CR>
nnoremap Y y$

inoremap jj <ESC>
inoremap kk <ESC>
inoremap jk <ESC>

nnoremap <leader>ft :! python -m behave <CR>

nnoremap <leader>ev :e ~/.vimrc <CR>
nnoremap <leader>sv :so ~/.vimrc <CR>

nnoremap <leader>sp vip:sort<CR>

nnoremap <leader>th  :tabfirst<CR>
nnoremap <leader>tj  :tabnext<CR>
nnoremap <leader>tk  :tabprev<CR>
nnoremap <leader>tn  :tabnext<CR>
nnoremap <leader>tp  :tabprev<CR>
nnoremap <leader>tl  :tablast<CR>
nnoremap <leader>td  :tabclose<CR>

" Breaking habbits
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Ember specific mappings
cnoreabbrev eg !ember g

" Indent settings

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

" Wild stuff
set suffixes+=.a,.o,.pyc
set wildignore+=*.o,*.so,*.pyc
set wildignore+=*/bower_components/*,*/node_modules/*,*/dist/*,*/.tmp*,*/tmp*,*/build/*,*/__pycache__/*,*/venv/*
let NERDTreeIgnore = ['\.pyc$']

" Statusline
set laststatus=2

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Extra per project configuration
if $PWD != $HOME
    if filereadable('.vimrc')
        source .vimrc
    endif
endif
