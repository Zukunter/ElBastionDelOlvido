return {
	"echasnovski/mini.animate",
	version = "*",
	config = function()
		local animation = require("mini.animate")
		animation.setup({
			-- Cursor path animation / Animación del trayecto del cursor
			cursor = { enable = false },
			-- Smooth scrolling / Desplazamiento suave
			scroll = { enable = true, subscroll = animation.gen_subscroll.equal() },
			-- Window resize animation / Animación al redimensionar ventanas
			resize = { enable = true },
			-- Window open/close animation / Animación al abrir/cerrar ventanas
			open = { enable = true },
			close = { enable = true },
		})
	end,
}
