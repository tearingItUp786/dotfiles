return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"stevearc/conform.nvim",
		"b0o/SchemaStore.nvim",
	},
	config = function()
		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("cmp_nvim_lsp").default_capabilities({})

		-- we need to do this so that we stop seeing this issue
		-- we also need to download neovim 0.11
		-- https://github.com/neovim/neovim/issues/26520
		-- local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
		-- 	workspace = {
		-- 		didChangeWatchedFiles = {
		-- 			dynamicRegistration = false,
		-- 		},
		-- 	},
		-- })

		-- local lspconfig = require("lspconfig")

		local servers = {
			cssls = true,
			eslint = true,
			gopls = true,
			lua_ls = true,
			tailwindcss = {
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
								{ "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
							},
						},
						classAttributes = { "class", "className", "classList", "ngClass" },
					},
				},
			},
			-- ts_ls = true,
			tsgo = true,
			intelephense = {
				cmd = { "intelephense", "--stdio" },
				filetypes = { "php" },
			},
			["stimulus-language-server"] = {
				filetypes = { "blade" },
			},
		}

		local servers_to_install = vim.tbl_filter(function(key)
			local t = servers[key]
			if type(t) == "table" then
				return not t.manual_install
			else
				return t
			end
		end, vim.tbl_keys(servers))

		require("mason").setup()
		local ensure_installed = {
			-- "ts_ls",
			"tsgo",
			"lua_ls",
			"eslint",
			"html",
			"cssls",
			"tailwindcss",
			"gopls",
			"intelephense",
			"stimulus-language-server",
		}

		vim.list_extend(ensure_installed, servers_to_install)
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)

			-- lspconfig[name].setup(config)
			vim.lsp.config(name, config)
			vim.lsp.enable(name)

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0 })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
				end,
			})

			-- Autoformatting Setup
			local conform = require("conform")
			conform.setup({
				stop_after_first = true,
				formatters_by_ft = {
					lua = { "stylua", stop_after_first = true },
					css = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd" },
					html = { "prettierd", "prettier", stop_after_first = true },
					php = { "php-cs-fixer" },
					blade = { "blade-formatter" },
				},
				formatters = {
					["php-cs-fixer"] = {
						command = "php-cs-fixer",
						args = {
							"fix",
							"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
							"$FILENAME",
						},
						stdin = false,
					},
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
						lsp_fallback = false,
						quiet = true,
					})
				end,
			})
		end
	end,
}
