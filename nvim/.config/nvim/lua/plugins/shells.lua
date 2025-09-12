return {
	{
	  "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim"
    },
    opts = {}
  },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "instant-markdown/vim-instant-markdown", ft = "markdown", build = "yarn install" },
}
