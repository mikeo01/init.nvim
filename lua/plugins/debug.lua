return {
	{

		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-neotest/neotest-jest",
			"thenbe/neotest-playwright",
			"jfpedroza/neotest-elixir",
			"olimorris/neotest-phpunit",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({}),
					require("neotest-playwright")({}),
					require("neotest-phpunit")({}),
					require("neotest-elixir")({}),
				},
			})
		end,
		keys = {
			{ "<localleader>t", "<CMD>lua require('neotest').run.run()<CR>", desc = "Run nearest test" },
		},
	},
	{
		"folke/trouble.nvim",
		opts = {},
	},
}
