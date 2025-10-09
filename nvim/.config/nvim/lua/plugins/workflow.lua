return {
	{ "tpope/vim-surround" },
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"julienvincent/nvim-paredit",
		opts = {},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		opts = {},
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
	{
		"linrongbin16/gentags.nvim",
		opts = {},
	},
	{
		"liuchengxu/vista.vim",
	},
	{
		"stevearc/overseer.nvim",
		opts = {},
	},
	{
		"coffebar/neovim-project",
		opts = {
			projects = { -- define project roots
				"~/projects/*",
				"~/.config/*",
			},
			picker = {
				type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
			},
		},
		init = function()
			-- enable saving the state of plugins in the session
			vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			-- optional picker
			{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
			-- optional picker
			{ "ibhagwan/fzf-lua" },
			-- optional picker
			{ "folke/snacks.nvim" },
			{ "Shatur/neovim-session-manager" },
		},
		lazy = false,
		priority = 100,
		keys = {
			{ "<C-p>", "<cmd>NeovimProjectDiscover<cr>" },
			{ "P", "<cmd>NeovimProjectLoadRecent<cr>" },
		},
	},
}
