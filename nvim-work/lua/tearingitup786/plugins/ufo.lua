return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		{ "kevinhwang91/promise-async" },
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		{ "neovim/nvim-lspconfig" },
	},
	config = function()
		-- Set up fold options
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value
		vim.o.foldlevelstart = 99 -- Start with all folds open
		vim.o.foldenable = true

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

		-- Option 3: treesitter as a main provider instead
		-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
		-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				-- Support for multiple languages
				local supported_filetypes = {
					"typescript",
					"typescriptreact",
					"javascript",
					"javascriptreact",
					"php",
					"go",
					"html",
					"css",
					"scss",
					"sass",
					"less",
					"lua",
					"python",
					"rust",
					"java",
					"c",
					"cpp",
					"json",
					"yaml",
					"yml",
					"markdown",
					"vim",
					"sh",
					"bash",
					"zsh",
					"fish",
					"xml",
					"sql",
					"toml",
					"ini",
					"conf",
					"dockerfile",
					"makefile",
					"cmake",
					"vue",
					"svelte",
					"astro",
					"tsx",
					"jsx",
				}

				-- Check if the filetype is supported
				for _, ft in ipairs(supported_filetypes) do
					if filetype == ft then
						return { "treesitter", "indent" }
					end
				end

				-- Fallback to indent for unsupported filetypes
				return { "indent" }
			end,
		})
	end,
}
