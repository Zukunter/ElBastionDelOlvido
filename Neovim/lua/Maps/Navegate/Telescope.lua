Telescope = require("telescope.builtin")

vim.keymap.set("n", "po", Telescope.find_files, {})
vim.keymap.set("n", "pl", Telescope.live_grep, {})
-- vim.keymap.set("n", "ts", Telescope, {})
vim.keymap.set("n", "pp", Telescope.buffers, {})
vim.keymap.set("n", "pg", Telescope.help_tags, {})
vim.keymap.set("n", "pf", Telescope.oldfiles, {})
vim.keymap.set("n", "pd", function()
	Telescope.diagnostics({
		-- severity = "error",
		path_display = { "hidden" }, -- Oculta la ruta / Blendet den Pfad aus
		layout_strategy = "center", -- Cambia a vertical / Wechselt zu Vertikal
		layout_config = {
			width = 0.9, -- 50% del ancho de la pantalla / 50% der Bildschirmbreite
			height = 0.9, -- 40% de la altura / 40% der Höhe	
			prompt_position = "top", -- Prompt arriba / Prompt oben
		},
		sorting_strategy = "ascending",
	})
end, { desc = "LSP Diagnostics (Small)" })
vim.keymap.set("n", "pq", Telescope.treesitter, {})
vim.keymap.set("n", "pr", Telescope.commands, {})
vim.keymap.set("n", "pt", Telescope.colorscheme, {})
vim.keymap.set("n", "pw", Telescope.lsp_definitions, {})
