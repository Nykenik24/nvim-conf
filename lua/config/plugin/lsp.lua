return function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		-- Install these LSPs automatically
		ensure_installed = {
			-- 'bashls', -- requires npm to be installed
			-- 'cssls', -- requires npm to be installed
			-- 'html', -- requires npm to be installed
			"lua_ls",
			-- 'jsonls', -- requires npm to be installed
			"lemminx",
			"marksman",
			"quick_lint_js",
			-- 'tsserver', -- requires npm to be installed
			-- 'yamlls', -- requires npm to be installed
		},
	})

	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lsp_attach = function(client, bufnr)
		-- Create your keybindings here...
	end

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

	-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
	local open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded" -- Set border to rounded
		return open_floating_preview(contents, syntax, opts, ...)
	end
end
