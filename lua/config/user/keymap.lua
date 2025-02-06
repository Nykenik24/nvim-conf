-- set leader
vim.g.mapleader = " "

local set = vim.keymap.set

-- neaterm --
set("n", "<leader>t", "", { desc = "Terminal" })
set("n", "<leader>tf", "<cmd>NeatermFloat<cr>", { desc = "Open float terminal" })

-- lsp actions --
set("n", "<leader>l", "", { desc = "LSP actions" })
local bufmap = function(mode, lhs, rhs, desc)
	desc = desc or nil
	local opts = { buffer = true, desc = desc }
	vim.keymap.set(mode, lhs, rhs, opts)
end

local lsp_actions = "<leader>l"
bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Get information of hovered symbol.")
bufmap("n", lsp_actions .. "d", "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to definition.")
bufmap("n", lsp_actions .. "D", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump to declaration.")
bufmap(
	"n",
	lsp_actions .. "i",
	"<cmd>lua vim.lsp.buf.implementation()<cr>",
	"List all implementations of hovered symbol."
)
bufmap("n", lsp_actions .. "o", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Jump to type definitions.")
bufmap("n", lsp_actions .. "r", "<cmd>lua vim.lsp.buf.references()<cr>", "List all references of hovered symbol.")
bufmap("n", lsp_actions .. "s", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display function signature info.")
bufmap("n", lsp_actions .. "r", "<cmd>lua require('renamer').rename()<cr>", "Rename symbol hovered.")
bufmap(
	"n",
	lsp_actions .. "c",
	"<cmd>lua vim.lsp.buf.code_action()<cr>",
	"Select code action available at current cursor pos."
)

bufmap("n", lsp_actions .. "d", "", "Diagnostic.")
bufmap("n", lsp_actions .. "dl", "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics in float window.")
bufmap("n", lsp_actions .. "d[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Move to previous diagnostic.")
bufmap("n", lsp_actions .. "d]", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Move to next diagnostic.")
