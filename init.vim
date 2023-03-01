 " ~/.config/nvim/init.vim
 set runtimepath^=~/.vim runtimepath+=~/.vim/after
 let &packpath = &runtimepath
 source ~/.vimrc

" Custom
colorscheme dracula

" Maps
nnoremap <leader>u :UndotreeToggle<CR>

" Plugs
lua require('plugins')
