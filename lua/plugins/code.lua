return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		opts = {
			formatters_by_ft = {
				fennel = { "fnlfmt" },
				clojure = { "zprint" },
				json = { "fixjson" },
				typescript = { "eslint_d" },
				javascript = { "eslint_d" },
				php = { "php_cs_fixer", "phpinsights" },
				elixir = { "mix" },
				lua = { "stylua" },
				["*"] = { "codespell" },
			},

			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		},
		keys = {
			{ "<leader>f", "<CMD>lua require('conform').format()<CR>", desc = "Run nearest test" },
		},
	},
}
