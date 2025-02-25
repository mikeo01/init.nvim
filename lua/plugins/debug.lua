return {
	{

		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-jest",
			"jfpedroza/neotest-elixir",
			"olimorris/neotest-phpunit",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({}),
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
