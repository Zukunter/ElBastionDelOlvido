return {
	"folke/tokyonight.nvim",
	lazy = true,
	-- priority = 1000,
	opts = {
		style = "storm", -- o "night", "moon", "day"
		transparent = true, -- ESTO ACTIVA LA TRANSPARENCIA
		styles = {
			-- También puedes hacer que las ventanas flotantes sean transparentes
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
	end,
}
