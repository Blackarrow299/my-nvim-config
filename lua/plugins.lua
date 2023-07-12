local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here

  use "rebelot/kanagawa.nvim"

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function () require("config.lualine") end
  }

	use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim'}

  use 'neovim/nvim-lspconfig'
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }   -- buffer auto-completion
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

	use {
		"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.treesitter")
			require("nvim-treesitter.configs").setup {
			 ensure_installed = { "c", "lua", "python", "typescript" },
			}
		end
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function () require("config.telescope") end
	}

	use {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  }

	use { "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
	}

	use "rafamadriz/friendly-snippets"

	use {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config.null-ls")
			require("mason-null-ls").setup {
				handlers = {}
			}
    end
	}

	use {
		'akinsho/bufferline.nvim',
		tag = "*",
		requires = 'nvim-tree/nvim-web-devicons',
		config = function ()
			require("config.bufferline")
		end
	}

	use {
		"lukas-reineke/indent-blankline.nvim",
	}

	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup{
				create_autocmd = false,
			}
			require("barbecue.ui").toggle(true)
			vim.api.nvim_create_autocmd({
				"WinResized",
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end,
	})

	use({
			"kylechui/nvim-surround",
			tag = "*", -- Use for stability; omit to use `main` branch for the latest features
			config = function()
					require("nvim-surround").setup{}
			end
	})

	use {
			'numToStr/Comment.nvim',
			config = function()
					require('Comment').setup()
			end
	}

	use {
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function () require("todo-comments").setup() end
	}

	use({
		"cappyzawa/trim.nvim",
		config = function()
			require("trim").setup({
			  trim_on_write = true,
				trim_trailing = true,
				trim_last_line = true,
				trim_first_line = true,
			})
		end
	})

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function () require("config.nvimtree") end
	}

	use {
		"windwp/nvim-ts-autotag",
		config = function () require("nvim-ts-autotag").setup() end
	}


	use {
		"folke/which-key.nvim",
		config = function () require("wichkey") end
	}

	-- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
