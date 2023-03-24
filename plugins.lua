-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'JoosepAlviste/palenightfall.nvim'
  use { 'dracula/vim', as = 'dracula' }
  use 'preservim/nerdcommenter'
  use 'flazz/vim-colorschemes'
  use {
    "folke/todo-comments.nvim",
    --branch =  "neovim-pre-0.8.0",
    requires = "nvim-lua/plenary.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {
        signs = true,
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
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  }
  -- Lazy loading:
  -- Load on specific commands
  --use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use { 'andymass/vim-matchup', event = 'VimEnter' }

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'williamboman/mason.nvim',
    opt = false,
    config = function()
      require('mason').setup {
        ui = {
          icons = {
          package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      }
    end,
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    opt = false,
    config = function()
      require('mason-lspconfig').setup()
    end,
  }
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-lint'
  use { 'mhartington/formatter.nvim', opt = false }

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
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  }

  use 'editorconfig/editorconfig-vim'

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
