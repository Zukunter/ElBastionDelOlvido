{
	{
		"echasnovski/mini.files",
		version = "*",
		-- lazy = true,
		config = function()
			require("mini.files").setup({
				windows = {
					border = "double",
					max_number = 10, -- Miller columns limit / Limit für Miller-Spalten
					preview = true, -- Enable preview / Vorschau aktivieren
					width_focus = 25,
					width_preview = 60,
				},
				options = {
					use_as_default_explorer = true,
				},
				
			})
		end,
	},
},
