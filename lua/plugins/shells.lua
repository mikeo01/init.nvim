return {
	{ "tpope/vim-fugitive", dependencies = {
		"tpope/vim-dispatch",
		"radenling/vim-dispatch-neovim",
	} },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "instant-markdown/vim-instant-markdown", ft = "markdown", build = "yarn install" },
}
