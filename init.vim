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
nmap <leader>u :UndotreeShow <bar> UndotreeFocus<CR>
nmap <leader>U :UndotreeHide<CR>
nmap <leader>s :HopWord<CR>
nmap <leader>S :HopLine<CR>
nmap <leader>n :Neotree<CR>
cabbrev git Git
