return {
	{ "tpope/vim-surround" },
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
  {
    "julienvincent/nvim-paredit",
    opts = {}
  },
  {
    "ThePrimeagen/refactoring.nvim",
    opts = {}
  },
	{
		"folke/ts-comments.nvim",
		opts = {
			mappings = {
				basic = {
					gcc = function()
						require("ts-comments").toggle_linewise()
					end,

					gc = function()
						require("ts-comments").toggle_operator()
					end,
				},
			},
		},
	},
	{

		"echasnovski/mini.ai",
		opts = {},
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"johmsalas/text-case.nvim",
		opts = {},
	},
}
