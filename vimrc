set nocompatible
set number
set ruler
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
"set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
set nowrap          " Cut long lines
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=¶ 	" Wrap-broken line prefix
set textwidth=79	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
set autoindent		" Auto-indent new lines
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
set scrolloff=5     " lines to the end while scrolling
"set cursorline 
"set digraph	" Special characters e <BS> >
                " Or use CTRL-K e>
set undolevels=1000
set backspace=indent,eol,start
set laststatus=1

let tabs = 4
" Default tabs
let &softtabstop=tabs
let &shiftwidth=tabs
let &tabstop=tabs
set expandtab

"Maps
let mapleader = " "
map <leader>h :noh<CR>
map <leader>t :NERDTreeToggle<CR>
tnoremap <Esc> <C-\><C-n>

call plug#begin()
Plug 'rstacruz/sparkup'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'kien/ctrlp.vim'
"Plugin 'noah/vim256-color'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'vim-latex/vim-latex'
call plug#end()
filetype plugin on    " required
filetype plugin indent on    " required

set t_Co=256
"set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8

"highlight ColorColumn ctermbg=238
set colorcolumn=80

syntax enable
colorscheme adventurous
set background=dark
let g:tex_flavor='latex'
"let asmsyntax="nasm"

"" NERDTREE
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"" NERDCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['pylint'] "['fake'] 
let g:syntastic_lua_checkers = ['luacheck']
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

