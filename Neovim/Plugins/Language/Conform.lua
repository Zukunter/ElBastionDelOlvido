{
	"stevearc/conform.nvim",
	lazy = true,
	-- event = { "BufWritePre" }, -- Formatea al guardar
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			-- Lenguajes de Programación
			lua = { "stylua" },
			python = { "ruff" }, -- Primero arregla imports, luego formatea
			rust = { "rustfmt" },
			zig = { "zigfmt" },

			c = { "clang-format" },
			cs = { "csharpier" },
			java = { "google-java-format" },

			cpp = { "clang-format" },
			sh = { "shfmt" },
			zsh = { "shfmt" },
			bash = { "shfmt" },
			asm = { "asmfmt" }, -- Si instalas asm-lsp, este suele ser su compañero

			-- Archivos de Configuración y Web
			json = { "prettier" },
			jsonc = { "prettier" },
			css = { "prettier" },
			yaml = { "prettier" },
			toml = { "taplo" },
			html = { "prettier" },
			markdown = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			xml = { "xmlformatter" },

			-- Formateo Universal (Fallback)
			["_"] = { "trim_whitespace" },
		},
	},
},
