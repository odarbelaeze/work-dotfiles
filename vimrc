set nocompatible
filetype off

let g:python3_host_prog='~/.pyenv/versions/3.5.1/bin/python'

call plug#begin('~/.vim/bundle')

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-sort-motion'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'hynek/vim-python-pep8-indent'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" Settings

syntax enable
filetype plugin indent on
colorscheme badwolf
set nowrap
" set noswapfile " Cuz YOLO

" Numbers

set number
set relativenumber
set hlsearch
set clipboard=unnamed

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

" jsx
let g:jsx_ext_required = 0

" - Tmuxline

let g:tmuxline_powerline_separators = 0

" - python-mode
set completeopt=menu
let g:pymode_rope=0
let g:pymode_lint_ignore = "E501"

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
let g:syntastic_python_python_exec = '~/.pyenv/versions/3.5.1/bin/python'
let g:syntastic_python_flake8_args='--ignore=E501'

" - UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
" I need to configure this better so that it does not collide with
" vim-snippets
" let g:UltiSnipsSnippetsDir='~/.vim/snipps'
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips']

" - vim markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'js=javascript']

" The silver searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

nnoremap <leader>a :Ack! <cword>

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
let NERDTreeIgnore = ['\.pyc$', 'node_modules[[dir]]']

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

" Rust stuffs
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
