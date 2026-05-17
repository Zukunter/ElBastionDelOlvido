local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
--nexus -i ./Plugins
	checker = {
		enabled = true, 
		notify = false, 
	},
})
--nexus -i ./Maps 
--nexus -i ./Configuration 
--nexus -i ./StartUp 
