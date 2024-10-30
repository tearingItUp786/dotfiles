return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	-- 			transparent = true,
	-- 			styles = {
	-- 				sidebars = "transparent",
	-- 				floats = "transparent",
	-- 			},
	-- 		})
	--
	-- 		vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },
	{

		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			vim.opt.background = "dark" -- set this to dark or light
			vim.cmd("colorscheme oxocarbon")
		end,
	},
}
