local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

return require("lazy").setup({
	-- "tanvirtin/monokai.nvim",
	-- "loctvl842/monokai-pro.nvim",
	"folke/tokyonight.nvim",
	-- "EdenEast/nightfox.nvim",
	{ "catppuccin/nvim", as = "catppuccin-mocha" },
	-- "xiyaowong/nvim-transparent",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-emoji",
	"hrsh7th/cmp-nvim-lua",
	"tyru/open-browser.vim",
	"karb94/neoscroll.nvim",
	"windwp/nvim-ts-autotag",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"rhysd/git-messenger.vim",
	"onsails/lspkind.nvim",
	"hrsh7th/cmp-nvim-lsp",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		-- "rafamadriz/friendly-snippets", -- a bunch of snippets to use
	},
	"folke/which-key.nvim",
	"alexghergh/nvim-tmux-navigation",
	"mechatroner/rainbow_csv",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"christianchiarulli/nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				opts = {},
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{
		"nvim-telescope/telescope.nvim",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	-- { "edluffy/hologram.nvim" },
	{ "akinsho/toggleterm.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				---Add a space b/w comment and the line
				padding = true,
				---Whether the cursor should stay at its position
				sticky = true,
				---Lines to be ignored while (un)comment
				ignore = nil,
				---LHS of toggle mappings in NORMAL mode
				toggler = {
					---Line-comment toggle keymap
					line = "gcc",
					---Block-comment toggle keymap
					block = "gbc",
				},
				---LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					---Line-comment keymap
					line = "gc",
					---Block-comment keymap
					block = "gb",
				},
				---LHS of extra mappings
				extra = {
					---Add comment on the line above
					above = "gcO",
					---Add comment on the line below
					below = "gco",
					---Add comment at the end of line
					eol = "gcA",
				},
				---Enable keybindings
				---NOTE: If given `false` then the plugin won't create any mappings
				mappings = {
					---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
					basic = true,
					---Extra mapping; `gco`, `gcO`, `gcA`
					extra = true,
				},
				---Function to call before (un)comment
				pre_hook = nil,
				---Function to call after (un)comment
				post_hook = nil,
			})
		end,
	},
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				openai_params = {
					model = "gpt-4-1106-preview",
				},
				api_key_cmd = "op read op://private/OpenAI/credential --no-newline",
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvimdev/lspsaga.nvim",
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					folder_level = 5,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{
		"glepnir/dashboard-nvim",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" }, -- for markdown previewing
})
