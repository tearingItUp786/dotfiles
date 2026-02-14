return {
	"nickjvandyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "opencode_terminal",
			callback = function(event)
				local opts = { buffer = event.buf, silent = true }
				vim.keymap.set("t", "<C-h>", "<C-\\><C-n><cmd>NvimTmuxNavigateLeft<CR>", vim.tbl_extend("force", opts, { desc = "Exit opencode left" }))
				vim.keymap.set("t", "<C-j>", "<C-\\><C-n><cmd>NvimTmuxNavigateDown<CR>", vim.tbl_extend("force", opts, { desc = "Exit opencode down" }))
				vim.keymap.set("t", "<C-k>", "<C-\\><C-n><cmd>NvimTmuxNavigateUp<CR>", vim.tbl_extend("force", opts, { desc = "Exit opencode up" }))
				vim.keymap.set("t", "<C-l>", "<C-\\><C-n><cmd>NvimTmuxNavigateRight<CR>", vim.tbl_extend("force", opts, { desc = "Exit opencode right" }))
			end,
		})

		-- Leader-based keymaps.
		vim.keymap.set({ "n", "x" }, "<leader>oca", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode" })
		vim.keymap.set({ "n", "x" }, "<leader>oce", function()
			require("opencode").select()
		end, { desc = "Execute opencode action" })
		vim.keymap.set("n", "<leader>oct", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })

		vim.keymap.set({ "n", "x" }, "<leader>ocr", function()
			return require("opencode").operator("@this ")
		end, { desc = "Add range to opencode", expr = true })
		vim.keymap.set("n", "<leader>ocl", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Add line to opencode", expr = true })

		vim.keymap.set("n", "<leader>ocu", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "Scroll opencode up" })
		vim.keymap.set("n", "<leader>ocd", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "Scroll opencode down" })
	end,
}
