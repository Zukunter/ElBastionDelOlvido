			vim.api.nvim_create_user_command("MasonFormat", function()
	-- Inicializar Mason (esto carga sus configuraciones sin abrir la ventana)
	require("mason").setup()

	-- Ejecutar conform.nvim para formatear el buffer actual
	require("conform").format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 1000,
	})
end, { desc = "Initialize Mason and format buffer" })
vim.keymap.set("n", "Mf", ":MasonFormat<CR>", { desc = "Mason setup + Format" })
