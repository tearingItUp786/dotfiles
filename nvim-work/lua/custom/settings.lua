local o = vim.opt
local options = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

o.guicursor = ""

o.nu = true
o.relativenumber = true

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

o.hlsearch = false
o.incsearch = true

o.wrap = false
o.cursorline = true
o.termguicolors = true
o.background = "dark"

o.splitright = true
o.splitbelow = true
o.spelllang = "en_us"
vim.g.mapleader = " "

-- toggling the terminal was a real bitch
-- keymap("n", "<C-Backslash>", "<cmd>ToggleTerm<CR>", options)
--
-- -- allow us to open a browser for links
keymap("n", "gx", "<Plug>(openbrowser-smart-search)", options)

o.clipboard = "unnamedplus"

o.spell = true
o.spelllang = "en_ca"

vim.cmd("highlight SpellBad cterm=undercurl gui=undercurl guisp=Magenta")

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "netrw" },
	group = vim.api.nvim_create_augroup("NetrwOnRename", { clear = true }),
	callback = function()
		vim.keymap.set("n", "R", function()
			local original_file_path = vim.b.netrw_curdir .. "/" .. vim.fn["netrw#Call"]("NetrwGetWord")

			vim.ui.input({ prompt = "Move/rename to:", default = original_file_path }, function(target_file_path)
				if target_file_path and target_file_path ~= "" then
					local file_exists = vim.uv.fs_access(target_file_path, "W")

					if not file_exists then
						vim.uv.fs_rename(original_file_path, target_file_path)

						Snacks.rename.on_rename_file(original_file_path, target_file_path)
					else
						vim.notify(
							"File '" .. target_file_path .. "' already exists! Skipping...",
							vim.log.levels.ERROR
						)
					end

					-- Refresh netrw
					vim.cmd(":Ex " .. vim.b.netrw_curdir)
				end
			end)
		end, { remap = true, buffer = true })
	end,
})
