return {
	{

		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",

			-- adapters
			"nvim-neotest/neotest-jest",
			"olimorris/neotest-phpunit",
		},
		config = function()
			require("neotest").setup({
			  log_level = "debug",

				adapters = {
					require("neotest-jest"),
					require("neotest-phpunit"),
				},

				consumers = {
				  require("neotest").status,
				  require("neotest").diagnostic,
        },

        status = {
          virtual_text = true
        },

        signs = {
          enabled = true,
        }
			})
		end,
		keys = {
			{ "<localleader>t", "<CMD>lua require('neotest').run.run()<CR>", desc = "Run nearest test" },
			{ "<localleader>f", "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run nearest test" },
			{ "<localleader>w", "<CMD>lua require('neotest').run.run({jestCommand = 'jest --watch'})<CR>", desc = "Run nearest test" },
		},
		lazy = false
	},
	{
		"folke/trouble.nvim",
		opts = {},
	},
}
