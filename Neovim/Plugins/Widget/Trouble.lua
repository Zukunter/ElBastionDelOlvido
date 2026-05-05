{
	"folke/trouble.nvim",
	cmd = "Trouble",
	lazy = true,
	opts = {
		modes = {
			diagnostics = {
				-- Cuando presionas Enter, salta y cierra Trouble
				-- Wenn du Enter drückst, springt und schließt er Trouble
				events = {
					{ event = "CursorMoved", action = "close", filter = { pinned = false } },
				},
			},
		},
		focus = true, -- Auto-focus on open / Enfocar al abrir
		-- Default window options / Opciones de ventana por defecto
		win = {
			type = "float",
			position = { 0.45, 0.45 }, -- Center / Centro
			border = "rounded", -- "shadow", "none", "single"
			-- size = 0.4, -- 30% of the screen / 30% de la pantalla
			relative = "editor",
		},
		-- Visual signs / Iconos visuales
		icons = {
			indent = {
				top = "│ ",
				middle = "├─ ",
				last = "└─ ",
			},
		},
	},
},
