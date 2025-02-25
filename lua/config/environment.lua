-- Solarized Theme Settings
vim.g.solarized_italic_comments = true
vim.g.solarized_italic_keywords = true
vim.g.solarized_italic_functions = true
vim.g.solarized_italic_variables = true

-- Markdown Settings
vim.g.instant_markdown_autostart = 1
vim.g.instant_markdown_autoscroll = 1
vim.g.instant_markdown_mermaid = 1

-- Conjure Settings
vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
vim.g["conjure#client#fennel#stdio#command"] = "love ."

-- Editor Options
vim.opt.updatetime = 1000
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.copyindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 0
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 999
vim.opt.background = "light"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.cmd("silent! colorscheme NeoSolarized")
