-- 1. Your existing icons table
local signs = {
	Error = " ",
	Warn = " ",
	Hint = "󰛨 ",
	Info = " ",
}

-- 2. The modern way (replaces the 'for' loop and sign_define)
vim.diagnostic.config({
	virtual_text = {
		prefix = "󱧣 ",
		spacing = 4,
	},
	-- This section replaces your sign_define loop:
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

-- 3. Simplified Toggle Command
vim.g.diagnostics_visible = false -- State: Hidden
vim.diagnostic.enable(false) -- Action: Hide on start

vim.api.nvim_create_user_command("ToggleHints", function()
	local filter = { bufnr = 0 }
	local is_enabled = vim.lsp.inlay_hint.is_enabled(filter)
	vim.lsp.inlay_hint.enable(not is_enabled, filter)

	local status = not is_enabled and "On" or "Off"
	vim.notify("Inlay Hints: " .. status, vim.log.levels.INFO)
end, {})
vim.lsp.inlay_hint.enable(true)

vim.api.nvim_create_user_command("ToggleHints", function()
	local filter = { bufnr = 0 }
	local is_enabled = vim.lsp.inlay_hint.is_enabled(filter)

	-- En 0.10+, la firma es enable(enable, filter) o enable(bufnr, enable)
	-- In 0.10+, the signature is enable(enable, filter)
	vim.lsp.inlay_hint.enable(not is_enabled, filter)

	local status = not is_enabled and "On" or "Off"
	vim.notify("Inlay Hints: " .. status, vim.log.levels.INFO)
end, {})

-- 4. Keymaps
local map = vim.keymap.set

map("n", "l.", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "l", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "l-", vim.lsp.buf.references, { desc = "Show references" })
map("n", "ll", vim.lsp.buf.hover, { desc = "Show hover" })
map("n", "lj", vim.diagnostic.open_float, { desc = "Open error" })
map("n", "l,", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map("n", "lk", vim.diagnostic.goto_prev, { desc = "Go prev" })
map("n", "lñ", vim.diagnostic.goto_next, { desc = "Go next" })
map("n", "lp", ":ToggleDiagnostics<CR>", { desc = "Toggle LSP Diagnostics" })
map("n", "lo", ":ToggleHints<CR>", { desc = "Toggle LSP Inlay Hints" })

map("n", "lm", vim.lsp.buf.implementation, { desc = "List implementation" })
map("n", "lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "lc", vim.lsp.buf.code_action, { desc = "Code action" })
vim.api.nvim_create_user_command("ToggleDiagnostics", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, {})
