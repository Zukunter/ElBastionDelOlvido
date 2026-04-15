vim.keymap.set("n","pe", "<cmd>Trouble diagnostics toggle<cr>")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "trouble",
	callback = function()
		local opts = { buffer = true, silent = true }
		local trouble = require("trouble")
		vim.keymap.set("n", "w", function()
			trouble.action("fold_toggle")
		end, opts)

		vim.keymap.set("n", "c", function()
			trouble.action("fold_close_all")
		end, opts)

		vim.keymap.set("n", "x", function()
			trouble.action("fold_open_all")
		end, opts)

		vim.keymap.set("n", "<cr>", function()
			trouble.jump()
			trouble.close()
		end, opts)
	end,
})
