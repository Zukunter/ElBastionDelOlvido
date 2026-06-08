vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.sidescrolloff= 4
vim.opt.sidescroll= 5
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust", "zig", "c", "cpp", "zsh", "sh", "python" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})
