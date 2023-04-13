set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Plugs
lua require('plugins')
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

augroup c_file
  autocmd!
  autocmd FileType c echohl Title | echo "Don't forget to free !" | echohl None | setlocal cindent
augroup end

augroup vim_file
  autocmd!
  autocmd FileType vim echohl Title | echo "Conf must go on." | echohl None
augroup end

augroup lua_file
  autocmd!
  autocmd FileType lua echohl Title | echo "You have good taste in embedded lang." | echohl None
augroup end

" Language Server setup
lua require('lspconfig').clangd.setup{}
lua require('lspconfig').lua_ls.setup{}
lua require('lspconfig').vimls.setup{}

" Custom look
colorscheme dracula

" Maps
nmap <silent> <leader>u :UndotreeShow <bar> UndotreeFocus<CR>
nmap <silent> <leader>U :UndotreeHide<CR>
nmap <silent> <leader>s :HopWord<CR>
nmap <silent> <leader>S :HopLine<CR>
nmap <silent> <leader>n :Neotree<CR>
cabbrev git Git
cabbrev gitsigns Gitsigns

" Custom mapping per plugin
let s:map_dir = stdpath('config').'/map'
let &runtimepath .= s:map_dir
runtime map/barbar.map.vim
runtime map/telescope.map.vim

