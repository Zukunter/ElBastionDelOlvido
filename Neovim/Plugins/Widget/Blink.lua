{
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = "rafamadriz/friendly-snippets",

	opts = {
		-- KEYMAPS
		keymap = {
			preset = "none",
			["<C-h>"] = { "show_signature", "hide_signature", "fallback" }, -- Toggle manual
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-w>"] = { "scroll_documentation_up", "fallback" },
			["<C-s>"] = { "scroll_documentation_down", "fallback" },
			["<Enter>"] = { "accept", "fallback" },
			["<C-Space>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.cancel()
					else
						return cmp.show()
					end
				end,
			},
		},
		-- ESTÉTICA GENERAL
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		-- SIGNATURE HELP (Parámetros de función)
		signature = {
			enabled = true,
			window = {
				border = "double",
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder",
			},
		},

		-- MOTOR DE BÚSQUEDA
		fuzzy = { implementation = "prefer_rust_with_warning" },

		-- CONFIGURACIÓN DE COMPLETADO
		completion = {
			menu = {
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 2 },
					},
					treesitter = {
						"lsp", "treesitter"
					},
				},
			},
			ghost_text = {
				enabled = false,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			trigger = {
				show_on_insert_on_trigger_character = true,
				show_on_keyword = true,
			},
			documentation = {
				auto_show = true,
				window = { border = "double" },
			},
		},

		-- FUENTES DE DATOS
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
},
