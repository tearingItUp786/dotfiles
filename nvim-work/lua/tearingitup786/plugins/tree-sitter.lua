return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = "all",
			sync_install = false,
			auto_install = false,
			highlight = {
				enable = true,
			},
		})
	end,
}
