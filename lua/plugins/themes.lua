return {
	-- [Themes]
	{ "ellisonleao/gruvbox.nvim" },
	{
		"overcache/NeoSolarized",
		config = function()
			vim.cmd("colorscheme NeoSolarized")
		end,
	},
}
