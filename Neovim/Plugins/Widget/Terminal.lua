{
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = "ToggleTerm",
	lazy = true,
	opts = {
		--   open_mapping = [[<c-t]], -- Press Ctrl + \ to toggle
		direction = "float", -- This makes it floating
		shade_terminals = false,
		start_in_insert = true,
		insert_mappings = false, -- Whether or not the open mapping applies in insert mode
		terminal_mappings = true, -- Whether or not the open mapping applies in the opened terminals
		persist_size = true,
		close_on_exit = false,
		shell = vim.o.shell,
		float_opts = {
			border = "curved", -- 'single', 'double', 'shadow', 'curved'
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
},
