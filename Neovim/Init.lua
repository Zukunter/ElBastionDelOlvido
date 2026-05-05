--Si hola
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
--nexus(/home/Zukunter/User/ElBastionDelOlvido/Neovim/Plugins)
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	},
})

--nexus(/home/Zukunter/User/ElBastionDelOlvido/Neovim/Maps)
--nexus(/home/Zukunter/User/ElBastionDelOlvido/Neovim/Configuration)
--nexus(/home/Zukunter/User/ElBastionDelOlvido/Neovim/StartUp)
