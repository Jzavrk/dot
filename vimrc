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
set textwidth=80	" Line wrap (number of cols)
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
set background=dark

set mouse=

" Custom
set listchars=eol:₿,tab:Σ+3,trail:Δ,nbsp:Ξ

let g:tex_flavor='latex'
let asmsyntax='nasm'

" Maps
let mapleader = " "
nmap <silent> <leader>h :nohlsearch<CR>
" Windows specific
nnoremap <leader>T <C-]>
nnoremap <leader>v <C-v>
tnoremap <Esc> <C-\><C-n>
"tnoremap <leader>t <C-]>
" Git patch maps
vmap <leader>- :s/^-/ /<CR>
vmap <leader>+ :g/^+/d<CR>
nmap <leader>* :echo "🖕, not implemented."<CR>
