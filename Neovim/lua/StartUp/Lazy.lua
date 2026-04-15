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
	spec = {
		{ import = "Plugins.Cosmetic.Effects" },
		{ import = "Plugins.Cosmetic.Themes" },
		{ import = "Plugins.Basic" },
		{ import = "Plugins.Widget" },
		{ import = "Plugins.Navegate" },
		{ import = "Plugins.Select" },
		{ import = "Plugins.Language" },
	},
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	},
})
