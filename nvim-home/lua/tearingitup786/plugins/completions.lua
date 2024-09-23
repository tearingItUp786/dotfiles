return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		-- "rafamadriz/friendly-snippets", -- a bunch of snippets to use
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			{
				"windwp/nvim-ts-autotag",
				config = function()
					require("nvim-ts-autotag").setup()
				end,
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				config = true,
				-- use opts = {} for passing setup options
				-- this is equivalent to setup({}) function
			},
		},
		config = function()
			require("custom.completion")
		end,
	},
}
