local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- Ensure lazy.nvim is installed
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})

	-- Ensure Nerd Font is installed
	local font_path = "~/.local/share/fonts/Ubuntu Mono Nerd Font Complete.ttf"
	if vim.fn.filereadable(font_path) == 0 then
		vim.fn.system({
			"mkdir",
			"-p",
			"~/.local/share/fonts",
		})
		vim.fn.system({
			"curl",
			"-fLo",
			font_path,
			"https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf",
		})
	end
end
vim.opt.rtp:prepend(lazypath)
