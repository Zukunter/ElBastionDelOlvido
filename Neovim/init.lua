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


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Forzamos la activación sin verificar capabilities primero para testear
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})
require("lazy").setup({
	{
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
},
{
  "rcarriga/nvim-notify",
  opts = {
    timeout = 3000, -- Verschwindet nach 3 Sekunden / Disappears after 3s 
    render = "minimal", -- Passt zu deinem minimalistischen Stil / Fits your minimalist style
    stages = "fade", -- Sanfter Übergang / Smooth transition
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
  end,
},
{
	"sphamba/smear-cursor.nvim",
	opts = {
		-- You can customize the color to match your theme
		-- Puedes personalizar el color para que combine con tu tema
		stiffness = 0.7, -- Higher = faster / Más alto = más rápido
		scroll_buffer_space = true,
		smear_between_buffers = true,
		cursor_color = "#187A77",
		trailing_stiffness = 0.1, -- Trail speed / Velocidad de la estela
	},
},
{
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("everforest").setup({
            transparent_background_level = 1,
            italics = true,
    })
  end,
},
{
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
},
{
	{
		"EdenEast/nightfox.nvim",
		lazy = true, -- Cargar al inicio para evitar parpadeos
		-- priority = 1000, -- Asegurar que se cargue antes que otros plugins
		config = function()
			-- Default options
			require("nightfox").setup({
				options = {
					-- Compiled file's destination location
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					transparent = true, -- Disable setting background
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = false, -- Non focused panes set to alternative background
					module_default = true, -- Default enable value for modules
					colorblind = {
						enable = false, -- Enable colorblind support
						simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
						severity = {
							protan = 0, -- Severity [0,1] for protan (red)
							deutan = 0, -- Severity [0,1] for deutan (green)
							tritan = 0, -- Severity [0,1] for tritan (blue)
						},
					},
					styles = { -- Style to be applied to different syntax groups
						comments = "italic, underdotted", -- Value is any valid attr-list value `:help attr-list`
						conditionals = "italic",
						constants = "NONE",
						functions = "underline",
						keywords = "underdashed",
						numbers = "NONE",
						operators = "NONE",
						strings = "italic",
						types = "NONE",
						variables = "NONE",
					},
					inverse = { -- Inverse highlight for different types
						match_paren = false,
						visual = false,
						search = false,
					},
					modules = { -- List of various plugins and additional options
						-- ...
					},
				},
				palettes = {},
				specs = {},
				groups = {},
			})
		end,
	},
},
{
  "numToStr/Comment.nvim",
  opts = {
    -- Puedes dejar esto vacío para usar los atajos por defecto
  },
  config = function(_, opts)
    require("Comment").setup(opts)
  end,
},
{
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
	lazy = true,
    opts = {
        signs = {
            add          = { text = '┃' }, -- Emerald Green (#187A77)
            change       = { text = '┃' }, -- Gold (#D1902E)
            delete       = { text = '/' },
            topdelete    = { text = '-' },
            changedelete = { text = '||' },
            untracked    = { text = '[]' },
        },
        signcolumn = false,
        current_line_blame = true,
	signs_staged_enable = true,
        -- Tipp: Füge das hier hinzu, um den Blame-Text dezent zu halten
        -- Tip: Add this to keep the blame text subtle
		current_line_blame_formatter = '<author>, <committer_time:%Y-%m-%d> - <summary>',
        current_line_blame_opts = {
            virt_text_pos = 'eol', -- Am Ende der Zeile / At the end of the line
            delay = 500,
        },
    },
},
{
  "echasnovski/mini.pairs",
  version = false,
  config = function()
    require("mini.pairs").setup({
      -- Modos en los que se desactiva / Modi, in denen es deaktiviert ist
      modes = { insert = true, command = true, terminal = true },
      
      -- Opciones globales / Globale Optionen
      mappings = {
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
	['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
	       
        [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
	['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
        
        ['"'] = { action = 'open', pair = '""', neigh_pattern = '[^\\].' },
        ["'"] = { action = 'open', pair = "''", neigh_pattern = '[^\\].' },
        ['`'] = { action = 'open', pair = '``', neigh_pattern = '[^\\].' },

        --['"'] = { action = 'close', pair = '""', neigh_pattern = '[^\\].' },
        --["'"] = { action = 'close', pair = "''", neigh_pattern = '[^\\].' },
        --['`'] = { action = 'close', pair = '``', neigh_pattern = '[^\\].' },
      },
    })
  end,
},
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
{
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim", -- 1. Added dependency here
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Add this
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			telescope.setup({
				-- 2. ALL configurations must go inside these curly braces
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.6,
							preview_cutoff = 0,
						},
					},
					path_display = { "filename_first", "shorten" },
					sorting_strategy = "ascending",
					border = true,
					file_ignore_patterns = { "node_modules", ".git/", "target/", "dist/", "build/" },
					vimgrep_arguments = {
						"rg",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--color=never",
						"--column",
						"--smart-case",
						"--hidden",
					},
					mappings = {
						i = { -- Mappings for Insert mode
							-- ["<C-s>"] = actions.move_selection_next,
							-- ["<C-w>"] = actions.move_selection_previous,
							--["<C-s>"] = actions.move_selection_next,
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,

							["<C-a>"] = actions.preview_scrolling_left,
							["<C-d>"] = actions.preview_scrolling_right,
							["<C-w>"] = actions.preview_scrolling_up,
							["<C-s>"] = actions.preview_scrolling_down,
							["<CR>"] = actions.select_default,
							["<C-Escape>"] = actions.close,
							["<C-Q>"] = actions.close,
						},
						n = { -- Mappings for Normal mode
							["a"] = actions.preview_scrolling_left,
							["d"] = actions.preview_scrolling_right,
							["w"] = actions.preview_scrolling_up,
							["s"] = actions.preview_scrolling_down,
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
							["q"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")
		end,
	},
},
{
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			-- Globale Einstellungen für das Folding (Global settings for folding)
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- Entferne 'all' und 'hor' aus foldopen (Remove 'all' and 'hor' from foldopen)
			vim.opt.foldopen:remove({ "all" })
			-- Handler für die visuelle Darstellung (Handler for visual representation)
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = ("  󰁂 %d lines "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0

				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						table.insert(newVirtText, { chunkText, chunk[2] })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- Füllt den Rest mit Leerzeichen auf (Fills the rest with spaces)
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "DiagnosticWarn" })
				return newVirtText
			end

			require("ufo").setup({
				fold_virt_text_handler = handler,
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
				preview = {
					win_config = {
						winblend = 0,
						border = 'rounded',
					},
				},
			})
		end,
	},
},
{
  "sustech-data/wildfire.nvim",
  event = "VeryLazy",
	lazy = true,
 dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("wildfire").setup({
      keymaps = {
        init_selection = "<Cr>",
        node_incremental = "<Cr>",
        node_decremental = "<BackSpace>",
      },
    })
  end,
},
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
{
	"williamboman/mason.nvim",
	cmd = "Mason",
	ft = { "c", "cpp", "zig", "rust", "python", "asm", "s", "S" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Mason
		require("mason").setup()

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
				end
			end,
		})

		-- Servidores
		local servers = {
			asm_lsp = {
				filetypes = { "asm", "s", "S" },
				root_dir = require("lspconfig.util").root_pattern(".git", ".asm_lsp.toml"),
			},
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = true,
						inlayHints = {
							enable = true,
							typeHints = true,
							parameterHints = true,
							chainingHints = true,
							closureReturnTypeHints = true,
							bindingModeHints = true,
							reborrowHints = true,
							lifetimeElisionHints = true,
							expressionAdjustmentHints = true,
						},
						completion = {
							callable = { snippets = "fill_arguments" },
							autoimport = { enable = true },
							postfix = { enable = true },
						},
						imports = { granularity = { group = "module" } },
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
							},
						},
						assist = { expressionFillDefault = "default" },
						lens = { enable = true },
					},
				},
			},
			zls = {
				settings = {
					zls = {
						enable_snippets = true,
						warn_style = false,
						enable_autofix = true,
						operator_completions = true,
						include_at_in_builtins = true,
						highlight_global_var_declarations = true,
						max_completion_items = 100,
						enable_inlay_hints = true,
						inlay_hints_show_variable_type_hints = true,
						inlay_hints_show_parameter_name_hints = true,
						inlay_hints_show_builtin_format_hints = true,
						inlay_hints_hide_redundant_param_names = true,
						enable_semantic_tokens = true,
					},
				},
			},
			basedpyright = {
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
							autoImportCompletions = true,
							diagnosticMode = "openFilesOnly",
							reportMissingTypeStubs = false,
							reportUnusedImport = "warning",
							reportUnusedVariable = "warning",
							reportDuplicateImport = "error",
							useLibraryCodeForTypes = true,
							inlayHints = {
								variableTypes = true,
								callArgumentNames = true,
								functionReturnTypes = true,
								genericTypes = true,
							},
						},
					},
				},
			},
			clangd = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
					"--all-scopes-completion",
					"--header-insertion-decorators",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
					languageServerHidingHints = false,
				},
				settings = {
					clangd = {
						InlayHints = {
							Designators = true,
							Enabled = true,
							ParameterNames = true,
							DeducedTypes = true,
						},
					},
				},
			},
			dockerls = {
				settings = {
					docker = {
						languageserver = {
							diagnostics = {
								deprecatedDirectives = "error",
								instructionJSONInSingleQuotes = "warning",
								instructionCasing = "uppercase",
							},
							formatter = { ignoreMultiline = false },
						},
					},
				},
			},
			docker_compose_language_service = {
				filetypes = { "yaml.docker-compose", "yaml" },
				root_dir = require("lspconfig.util").root_pattern(
					"docker-compose.yaml",
					"docker-compose.yml",
					"compose.yaml",
					"compose.yml"
				),
			},
		}

		local formatters = {
			"stylua",
			"asmfmt",
			"clang-format",
			"google-java-format",
			"shfmt",
			"ruff",
			"taplo",
			"prettier",
			"xmlformatter",
			"csharpier",
		}

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		require("mason-tool-installer").setup({
			ensure_installed = formatters,
			auto_update = true,
			run_on_start = true,
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- API Neovim (0.11+)
		for name, config in pairs(servers) do
			config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
			vim.lsp.config(name, config)
			vim.lsp.enable(name)
		end
	end,
},
{
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      ensure_installed = {
        "rust", "zig", "c_sharp", "c", "cpp", "sql", "nasm", 
        "bash", "lua", "markdown", "markdown_inline", "python", "javascript",
        "toml", "xml", "yaml", "css", "dockerfile", "query", "json", "ron", "make",
      },
      highlight = {
        enable = true,
      },
      -- indent = {
      --   enable = true,
      -- },
    }, 
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = "*",
        callback = function()
          local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
          if lang then
            pcall(vim.treesitter.start)
          end
        end,
      })
    end,
  },
},

	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	},
})


vim.opt.number = true         -- Muestra números de línea
vim.opt.expandtab = true
vim.opt.cursorline = true     -- Resalta la línea actual
vim.opt.termguicolors = true  -- Soporte para colores de 24 bits
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.ignorecase = true -- Ignora mayúsculas al buscar
vim.opt.smartcase = true  -- Si usas una mayúscula, se vuelve sensible
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.sidescrolloff=8
vim.opt.sidescroll=5
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust", "zig", "c", "cpp", "zsh", "sh" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

vim.cmd("colorscheme everforest")
