set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Plugs
lua require('plugins')

" Custom
colorscheme dracula

" Maps
nmap <silent> <leader>u :UndotreeToggle<CR>
nmap <silent> <leader>s :HopWord<CR>
nmap <silent> <leader>S :HopLine<CR>
nmap <silent> <leader>n :Neotree<CR>
