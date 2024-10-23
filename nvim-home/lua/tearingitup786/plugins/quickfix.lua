return {
	{ "kevinhwang91/nvim-bqf", ft = "qf" },

	-- optional
	{
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	},
}
