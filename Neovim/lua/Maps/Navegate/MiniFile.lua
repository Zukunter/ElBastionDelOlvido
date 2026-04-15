-- Toggle mini.files / mini.files umschalten
vim.keymap.set("n", "ps", function()
	if not MiniFiles.close() then
		MiniFiles.open()
	end
end, { desc = "Toggle Mini Files" })
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		vim.keymap.set("n", "<CR>", function()
			MiniFiles.go_in({ close_on_file = true })
		end, { buffer = buf_id, desc = "Abrir y cerrar mini.files" })

		vim.keymap.set("n", "<C-e>", function()
			MiniFiles.synchronize()
		end, { buffer = buf_id, desc = "Sync to disk" })
		vim.keymap.set("i", "<C-e>", function()
			MiniFiles.synchronize()
		end, { buffer = buf_id, desc = "Sync to disk" })

		-- Go to parent directory with 'h' / In das übergeordnete Verzeichnis mit 'h'
		vim.keymap.set("n", "a", function()
			MiniFiles.go_out()
		end, { buffer = buf_id, desc = "Go out" })

		vim.keymap.set("i", "<C-a>", function()
			MiniFiles.go_out()
		end, { buffer = buf_id, desc = "Go out" })
		vim.keymap.set("n", "<C-a>", function()
			MiniFiles.go_out()
		end, { buffer = buf_id, desc = "Go out" })

		vim.keymap.set("n", "d", function()
			MiniFiles.go_in()
		end, { buffer = buf_id, desc = "Go in" })

		-- Strg + W zum Hochfahren (Up) / Ctrl + W to move up
		vim.keymap.set({ "n", "v" }, "<C-w>", "k", { desc = "Move up" })

		-- Strg + S zum Runterfahren (Down) / Ctrl + S to move down
		-- Hinweis: In manchen Terminals muss XOFF deaktiviert sein
		vim.keymap.set({ "n", "v" }, "<C-s>", "j", { desc = "Move down" })
		-- Open directory/file with 'l' / Verzeichnis/Datei öffnen mit 'l'
		vim.keymap.set("n", "<C-d>", function()
			MiniFiles.go_in()
		end, { buffer = buf_id, desc = "Go in" })
		vim.keymap.set("i", "<C-d>", function()
			MiniFiles.go_in()
		end, { buffer = buf_id, desc = "Go in" })
	end,
})
