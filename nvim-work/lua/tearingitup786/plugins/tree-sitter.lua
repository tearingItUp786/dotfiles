return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			-- Archived upstream parser repo currently breaks tarball installs.
			ignore_install = { "ipkg" },
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
