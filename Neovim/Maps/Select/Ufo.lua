local ufo = require("ufo")

-- Al presionar Flecha Izquierda, busca la ventana de vista previa y le da el foco
vim.keymap.set("n", "o<Tab>", function()
	local winid = ufo.peekFoldedLinesUnderCursor()
	if winid then
		-- Forzamos que la ventana sea enfocable y movemos el cursor
		vim.api.nvim_win_set_config(winid, { focusable = true })
		vim.api.nvim_set_current_win(winid)
	end
end, { desc = "Enfocar vista previa de UFO con Flecha Izquierda" })
vim.keymap.set("n", "oi", ufo.openAllFolds)
vim.keymap.set("n", "op", ufo.closeAllFolds)
vim.keymap.set("n", "ow", ufo.openFoldsExceptKinds)
vim.keymap.set("n", "oo", function()
	local keys = vim.api.nvim_replace_termcodes("za", true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Toggle fold" })
vim.keymap.set("n", "os", ufo.closeFoldsWith)
vim.keymap.set("n", "od", ufo.goNextClosedFold) -- Siguiente cerrada (Next closed)
vim.keymap.set("n", "oa", ufo.goPreviousClosedFold) -- Anterior cerrada (Prev closed)
