local parsers = {
	"bash",
	"blade",
	"css",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"php",
	"query",
	"scss",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

local filetypes = {
	"bash",
	"blade",
	"css",
	"go",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"jsonc",
	"lua",
	"markdown",
	"php",
	"query",
	"scss",
	"sh",
	"toml",
	"tsx",
	"typescript",
	"typescriptreact",
	"vim",
	"vimdoc",
	"yaml",
	"zsh",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})
		vim.treesitter.language.register("bash", { "sh", "zsh" })
		vim.treesitter.language.register("json", "jsonc")

		treesitter.install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TearingItUpTreesitter", { clear = true }),
			pattern = filetypes,
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
