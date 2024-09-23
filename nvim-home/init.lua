--[[
-- Setup initial configuration,
-- 
-- Primarily just download and execute lazy.nvim
--]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
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
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set up lazy, and load my `lua/custom/plugins/` folder
require("lazy").setup({ import = "tearingitup786/plugins" }, {
	change_detection = {
		notify = false,
	},
})
require("custom.settings")
