" Plugin 'mechatroner/rainbow_csv'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" git wrapper
Plugin 'tpope/vim-fugitive'

" install commentary
Plugin 'tpope/vim-commentary.git'

" install nerdtree from git hub
Plugin 'scrooloose/nerdtree.git'

" install light line from git
Plugin 'itchyny/lightline.vim.git'

" install surround
Plugin 'tpope/vim-surround'

" install colorschemes
" Plugin 'rafi/awesome-vim-colorschemes.git'

" colorschemes
" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'

Plugin 'noahfrederick/vim-noctu'
Plugin 'morhetz/gruvbox'

" syntax highlighting
Plugin 'vim-syntastic/syntastic'

" fuzzy search
Plugin 'kien/ctrlp.vim'

" install tagbar
Plugin 'majutsushi/tagbar'

" install tag managaer
Plugin 'ludovicchabant/vim-gutentags'

" install lightweight autocompleter
Plugin 'ajh17/VimCompletesMe' 


" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" unix commands for vim
Plugin 'tpope/vim-eunuch'

" html and css tool
Plugin 'mattn/emmet-vim'

" display git changes on the left side
Plugin 'airblade/vim-gitgutter'

Plugin 'chrisbra/csv.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" vim settings
set nu
syntax on
set encoding=utf-8
"
" change the backspace behaviour to delete any text
set backspace=indent,eol,start

let mapleader=" "
let maplocalleader="\\"

" change the language
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set textwidth=79
set expandtab
set autoindent

" splitting behaviour
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
" nnoremap <space> za

" lightline settings  \ 
set laststatus=2 " show the lightline
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'ctagstatus': 'gutentags#statusline()'
    \ },
    \ }



" colorscheme settings
if has('gui_running')
  set background=dark
  colorscheme gruvbox
  let g:gruvbox_vert_split = 'bg1'
  let g:gruvbox_sign_column = 'bg0'
else 
  colorscheme noctu
endif

:set guifont=Lucida_Console:h12

" set encoding
set encoding=utf-8
set fileencoding=utf-8

" Open NERDTree when vim starts without a file specifed
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree when vim opens with directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" map NERDTree window to ctrl-n
map <leader>n :NERDTreeToggle<CR>

" close Vim when nerdtree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" tagbar settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'C:\ctags58\ctags.exe'

" gutentags settings
let g:gutentags_ctags_executable = 'C:\ctags58\ctags.exe'


" vim-multiple-cursors settings
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ctrlp settings
" display hidden files, except the git folder
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|swp)$',
    \ }

" csv settings
aug CSV_Editing
		au!
		au BufRead,BufWritePost *.csv :%ArrangeColumn
		au BufWritePre *.csv :%UnArrangeColumn
aug end
