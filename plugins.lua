-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'JoosepAlviste/palenightfall.nvim'
  use {'dracula/vim', as = 'dracula'}
  use 'preservim/nerdcommenter'
  use 'flazz/vim-colorschemes'
  use 'rstacruz/vim-closer'
  use {
    "folke/todo-comments.nvim",
    --branch =  "neovim-pre-0.8.0",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
    end,
	opt = false
  }
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  -- Lazy loading:
  -- Load on specific commands
  --use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'

  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup {
		keys = 'qsdfghjklmazertyuiopwxcvbn',
		quit_key = '<ESC>',
		perm_method = TrieBacktrackFilling
	  }
    end,
  }
  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --use {
    --'w0rp/ale',
    --ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    --cmd = 'ALEEnable',
    --config = 'vim.cmd[[ALEEnable]]'
  --}

  -- Plugins can have dependencies on other plugins
  --use {
    --'haorenW1025/completion-nvim',
    --opt = true,
    --requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  --}

  -- Plugins can also depend on rocks from luarocks.org:
  --use {
    --'my/supercoolplugin',
    --rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  --}

  -- You can specify rocks in isolation
  --use_rocks 'penlight'
  --use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  --use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with call of vimscript function with argument
  --use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  --use {
    --'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    --requires = {'kyazdani42/nvim-web-devicons'}
  --}

  -- Use dependency and run lua function after load
  --use {
    --'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    --config = function() require('gitsigns').setup() end
  --}

  -- You can specify multiple plugins in a single call
  --use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

end)