local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({function(use)
  -- Setup Packer
  use {"wbthomason/packer.nvim"}

  -- Nvim tree 
  use {
	  "kyazdani42/nvim-tree.lua",
	  requires = {
		  "kyazdani42/nvim-web-devicons",
	  },
  }

  -- LSP
  use {
	  "williamboman/mason.nvim",
  }

  use {
	  "williamboman/mason-lspconfig.nvim",
  }

  use {
	  "neovim/nvim-lspconfig",
  }

  -- Gruvbox theme
  use {
	  "ellisonleao/gruvbox.nvim",
  }

  -- Lualine
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
  -- Colorizer
  use {
	  'norcalli/nvim-colorizer.lua',
  }

  -- Tag Viewer
  use 'preservim/tagbar'

  -- Alpha
  use {
	  'goolord/alpha-nvim',
	  requires = { 'BlakeJC94/alpha-nvim-fortune', opt = true },
  }

  -- Completion
  use {
	  'hrsh7th/nvim-cmp',
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- cmp sources --
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"

  -- Telescope
  use {
	  "nvim-telescope/telescope.nvim",
	  requires = {
		  "nvim-lua/plenary.nvim",
	  },
  }

  -- Indent-blankline
  use {
	  "lukas-reineke/indent-blankline.nvim",
  }

  -- Undotree
  use {
	  "jiaoshijie/undotree",
	  requires = {
		  "nvim-lua/plenary.nvim",
	  },
  }

  -- Comment 
  use {
	  'numToStr/Comment.nvim',
  }

  -- lsp_lines
  use {
	  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  }

  -- Comment 
  use {
	  'famiu/bufdelete.nvim',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end,
	},
}
})
