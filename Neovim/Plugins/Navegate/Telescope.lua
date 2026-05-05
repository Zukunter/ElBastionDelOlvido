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
