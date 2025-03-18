return function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		-- Install these LSPs automatically
		ensure_installed = {
			"bashls",
			"cssls",
			"html",
			"lua_ls",
			"jsonls",
			"lemminx",
			"marksman",
			"quick_lint_js",
			"ts_ls",
			"yamlls",
			"gopls",
			"taplo",
		},
	})

	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lsp_attach = function(client, bufnr) end

	-- Call setup on each LSP server
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				on_attach = lsp_attach,
				capabilities = lsp_capabilities,
			})
		end,
	})

	-- Lua LSP settings
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim", "love" },
				},
			},
		},
	})

	lspconfig.pylsp.setup({
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
	})

	lspconfig.clangd.setup({
		cmd = { "clangd" },
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
	})

	lspconfig.ts_ls.setup({
		filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", ".js", ".jsx" },
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
	})

	lspconfig.gopls.setup({
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		},
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
	})

	lspconfig.taplo.setup({
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
	})

	-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
	local open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded" -- Set border to rounded
		return open_floating_preview(contents, syntax, opts, ...)
	end

	-- vim.diagnostic.config({
	-- 	virtual_text = {
	-- 		severity = { min = vim.diagnostic.severity.ERROR },
	-- 	},
	-- 	signs = true,
	-- 	underline = true,
	-- 	update_in_insert = false,
	-- })
end
