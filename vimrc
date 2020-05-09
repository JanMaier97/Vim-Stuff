" Plugin 'mechatroner/rainbow_csv'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'ajh17/VimCompletesMe'
Plugin 'dense-analysis/ale'
Plugin 'itchyny/lightline.vim.git'
Plugin 'junegunn/goyo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mattn/emmet-vim'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki/vimwiki' 
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

" vim settings
set number
syntax on
colorscheme gruvbox
set encoding=utf-8
set backspace=indent,eol,start
set noerrorbells
set background=dark

let mapleader=" "
let maplocalleader="\\"

" change the language
" set langmenu=en_US
" let $LANG = 'en_US'
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

" tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set colorcolumn=80
set autochdir

" splitting behaviour
set splitbelow
set splitright

map - <C-W>-
map + <C-W>+

map <silent> <leader>h :wincmd h<CR>
map <silent> <leader>j :wincmd j<CR>
map <silent> <leader>k :wincmd k<CR>
map <silent> <leader>l :wincmd l<CR>
map <silent> <leader>H :wincmd H<CR>
map <silent> <leader>J :wincmd J<CR>
map <silent> <leader>K :wincmd K<CR>
map <silent> <leader>L :wincmd L<CR>
nmap <F8> :TagbarToggle<CR>
vmap <Leader>y "+y
noremap <Leader>= <C-W><C-=>
nnoremap <silent> <leader>vr :vertical resize 40<CR>
nnoremap <silent> <leader>v+ :vertical resize +5<CR>
nnoremap <silent> <leader>v- :vertical resize -5<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>

function! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction

nnoremap <leader>sp :call FixLastSpellingError()<CR>

set encoding=utf-8
set fileencoding=utf-8

" lightline 
set laststatus=2
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


" tagbar settings
let g:tagbar_ctags_bin = 'D:\ctags58\ctags.exe'

" gutentags 
let g:gutentags_ctags_executable = 'D:\ctags58\ctags.exe'


" vimtex settings
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 0
" let g:vimtex_view_method = 'sumatrapdf'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" vimwiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
