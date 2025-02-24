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
		mapping = {
			["<localleader>t"] = function()
				require("neotest").run.run()
			end,
		},
	},
	{
		"folke/trouble.nvim",
		opts = {},
	},
}
