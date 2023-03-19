set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Plugs
lua require('plugins')
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" Custom
colorscheme dracula

" Maps
nmap <silent> <leader>u :UndotreeShow <bar> UndotreeFocus<CR>
nmap <silent> <leader>U :UndotreeHide<CR>
nmap <silent> <leader>s :HopWord<CR>
nmap <silent> <leader>S :HopLine<CR>
nmap <silent> <leader>n :Neotree<CR>
cabbrev git Git
cabbrev gitsigns Gitsigns
