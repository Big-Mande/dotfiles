-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end,
  })
 
  use('nvim-treesitter/nvim-treesitter', {run=':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional
	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},
	  {'hrsh7th/cmp-buffer'},
	  {'hrsh7th/cmp-path'},
	  {'saadparwaiz1/cmp_luasnip'},
	  {'hrsh7th/cmp-nvim-lsp'},
	  {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}
use {
	"williamboman/mason.nvim",
	run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
use ('nvim-tree/nvim-web-devicons')
use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})
use {
  'glepnir/lspsaga.nvim',
  event = 'BufReadPost',
  config = function()
    require('lspsaga').setup()
  end,
  requires = { {'kyazdani42/nvim-web-devicons'} }
}

  use 'windwp/nvim-ts-autotag'
  end)
