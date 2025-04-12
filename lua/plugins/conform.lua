return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "pylint", "brunette", "isort" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				sh = { "shfmt" },
				css = { "prettierd" },
				html = { "htmlbeautifier" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				json = { "jsonlint" },
				go = { "gofumpt" },
				yaml = { "yamlfmt" },
				cmake = { "cmakelint" },
			},
		})
	end,
}
