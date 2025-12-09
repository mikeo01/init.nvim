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
    "hiphish/rainbow-delimiters.nvim"
  },
  {
    "windwp/nvim-autopairs",
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
    opts = {},
		keys = {
      { "s", "<Plug>(leap)" },
    }
	},
	{
		"johmsalas/text-case.nvim",
		opts = {},
	},
	{
		"liuchengxu/vista.vim",
	},
	{
		"stevearc/overseer.nvim",
		opts = {},
		keys = {
			{ "TO", "<cmd>OverseerOpen<cr>" },
			{ "TR", "<cmd>OverseerRun<cr>" },
		},
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
			{ "<leader>pp", "<cmd>NeovimProjectDiscover history<cr>" },
			{ "<leader>pr", "<cmd>NeovimProjectLoadRecent<cr>" },
		},
  },
  -- { 'augmentcode/augment.vim' },
}
