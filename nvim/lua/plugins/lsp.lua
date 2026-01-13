return {
	{
		-- Neovim Development Environment
		-- NeovimのLua変数をLSPに認識させる (Undefined global 'vim' 対策)
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				-- { path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Completion Engine
		-- 高速な自動補完エンジン (nvim-cmpの代替)
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		version = "*",

		opts = {
			-- 'default' preset maps <C-space> to show, <C-n>/<C-p> to navigate
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "accept", "fallback" },
				["<C-n>"] = { "show", "select_next", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
	{
		-- LSP Configuration
		-- Language Server Protocol の設定管理
		"neovim/nvim-lspconfig",
		dependencies = {
			-- LSP/Linter/Formatter installer
			-- 外部ツールのインストール管理 (LSP, DAP, Linter, Formatter)
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"whoissethdaniel/mason-tool-installer.nvim", -- Add this
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("mason").setup()

			-- Install tools automatically
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSPs (managed by mason-lspconfig but can be listed here too for unify)
					-- "gopls", "lua_ls", "marksman",

					-- Formatters (managed by conform.nvim)
					"stylua", -- Lua formatter
					"goimports", -- Go imports organizer
					"gofumpt", -- Go strict formatter
					"gopls",
					"marksman",
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "marksman", "gopls" },
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					-- Explicit configuration for gopls if needed
					["gopls"] = function()
						require("lspconfig").gopls.setup({
							settings = {
								gopls = {
									analyses = {
										unusedparams = true,
									},
									staticcheck = true,
									gofumpt = true,
								},
							},
						})
					end,
				},
			})

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wl', function()
					--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					-- end, opts)
					-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>F", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
