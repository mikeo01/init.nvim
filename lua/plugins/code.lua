return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				fennel = { "fnlfmt" },
				clojure = { "zprint" },
				json = { "fixjson" },
				typescript = { "prettier", "eslint_d" },
				javascript = { "prettier", "eslint_d" },
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
	},
}
