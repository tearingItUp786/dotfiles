local null_ls_status_ok, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not null_ls_status_ok then
	print("null-ls not found")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.goimports,
		formatting.golines,
		formatting.gofumpt,
		formatting.prettier,
		formatting.stylua,
		-- formatting.google_java_format,
		-- null_ls.builtins.diagnostics.cspell,
		-- null_ls.builtins.code_actions.cspell,
		-- diagnostics.flake8,
		-- diagnostics.spellcheck,
	},
	on_attach = function(client, bufnr)
		print("null-ls attached")
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(aClient)
							return aClient.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
