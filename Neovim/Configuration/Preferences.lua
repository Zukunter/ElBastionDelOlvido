vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.sidescrolloff=8
vim.opt.sidescroll=5
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust", "zig", "c", "cpp", "zsh", "sh" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
