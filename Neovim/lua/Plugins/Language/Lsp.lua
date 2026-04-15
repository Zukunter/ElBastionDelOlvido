return {
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
}
