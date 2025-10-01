return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		-- "rafamadriz/friendly-snippets", -- a bunch of snippets to use
		config = function()
			-- Expand the home directory explicitly; tilde is not always expanded by LuaSnip
			local snippet_path = vim.fn.expand("~/.dotfiles/snippets")
			if vim.fn.isdirectory(snippet_path) == 1 then
				-- Load custom vscode-style snippets from our dotfiles directory
				require("luasnip.loaders.from_vscode").lazy_load({ paths = { snippet_path } })
			else
				vim.notify("LuaSnip: snippet directory not found: " .. snippet_path, vim.log.levels.WARN)
			end
		end,
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
