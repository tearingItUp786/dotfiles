require("monokai-pro").setup({
	transparent_background = true,
	terminal_colors = true,
	devicons = true, -- highlight the icons of `nvim-web-devicons`
	styles = {
		comment = { italic = true },
		keyword = { italic = true }, -- any other keyword
		type = { italic = true }, -- (preferred) int, long, char, etc
		storageclass = { italic = true }, -- static, register, volatile, etc
		structure = { italic = true }, -- struct, union, enum, etc
		parameter = { italic = true }, -- parameter pass in function
		annotation = { italic = true },
		tag_attribute = { italic = true }, -- attribute of tag in reactjs
	},
	filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
	-- Enable this will disable filter option
	day_night = {
		enable = false, -- turn off by default
		day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
		night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
	},
	inc_search = "background", -- underline | background
	background_clear = {
		-- "float_win",
		"toggleterm",
		"telescope",
		-- "which-key",
		"renamer",
		"notify",
		"nvim-tree",
		-- "neo-tree",
		-- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
	}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
	plugins = {
		bufferline = {
			underline_selected = false,
			underline_visible = false,
		},
		indent_blankline = {
			context_highlight = "default", -- default | pro
			context_start_underline = false,
		},
	},
	---@param c Colorscheme
	override = function(c) end,
})
vim.cmd([[colorscheme monokai-pro]])

-- require("tokyonight").setup({
-- 	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
-- 	transparent = true,
-- 	styles = {
-- 		sidebars = "transparent",
-- 		floats = "transparent",
-- 	},
-- })
--
-- vim.cmd([[colorscheme tokyonight]])

-- Default options
--[[ require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = { -- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "NONE",
			keywords = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = {},
	specs = {},
	groups = {},
})

vim.cmd("colorscheme carbonfox") ]]
--
--[[ require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = true,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
vim.cmd("colorscheme catppuccin") ]]
