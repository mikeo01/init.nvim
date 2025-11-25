return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader><leader>", "<cmd>Telescope git_files<cr>" },
			{ "<leader>.", "<cmd>Telescope find_files<cr>" },
			{ "<leader>b", "<cmd>Telescope buffers<cr>" },
			{ "<leader>g", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>m", "<cmd>Telescope marks<cr>" },
			{ "?", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
			{ "M", "<cmd>Telescope keymaps<cr>" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						horizontal = {
							preview_cutoff = 0,
						},
					},

					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
						},
					},
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>e", "<cmd>Neotree filesystem reveal left toggle<cr>" },
		},
	},
	{
		"mhinz/vim-grepper",
		dependencies = { "kevinhwang91/nvim-bqf" },
		keys = { { "<leader>G", "<cmd>Grepper<cr>" } },
	},
}
