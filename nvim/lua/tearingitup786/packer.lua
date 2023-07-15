-- This file can be loaded by calling `lua require('plugins')` from your init.vim
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

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- theme
	use("tanvirtin/monokai.nvim")
	use("folke/tokyonight.nvim")
	use("EdenEast/nightfox.nvim")
	use("xiyaowong/nvim-transparent")
	use({ "catppuccin/nvim", as = "catppuccin-mocha" })

	-- treesitter is for syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- tree explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- null-ls is for formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	--mason is for installing language servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--lsp is the language server protocol
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind.nvim")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

	-- Completion
	use("christianchiarulli/nvim-cmp")
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use("zbirenbaum/copilot-cmp")
	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
	})

	-- Snippet
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	})

	-- which key bindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	use({
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})

			vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end,
	})
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	-- image viewer
	use({ "edluffy/hologram.nvim" })

	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	})

	--comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- using packer.nvim
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	use({
		"tpope/vim-fugitive",
	})

	use({
		"rhysd/git-messenger.vim",
	})

	use({ "tyru/open-browser.vim" })
	use({ "karb94/neoscroll.nvim" })
	use({ "windwp/nvim-ts-autotag" })
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommanded if need floating window support
end)
