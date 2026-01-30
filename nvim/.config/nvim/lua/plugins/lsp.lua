return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		opts = {
      inlay_hints = { enabled = true },
    },
		config = function()
			local lspconfig = vim.lsp.config

			local servers = {
				"intelephense",
				"ts_ls",
				"eslint",
				"html",
				"fennel-ls",
				"clojure_lsp",
				"cssls",
				"jsonls",
			}

			for _, server in ipairs(servers) do
        local ok, err = pcall(function()
            lspconfig[server].setup({
              on_attach = function(client, bufnr)
                local opts = { noremap = true }
                vim.api.nvim_buf_set_keymap(bufnr, "n",	"gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gD",	"<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>d", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)

                vim.lsp.inlay_hint(bufnr, true)
                
                vim.diagnostic.config({
                  virtual_text = true,
                  signs = true,
                  underline = true,
                })
              end,
            })
        end)

        if not ok then
            error("Setting up LSP for the following server failed: " .. server)
        end
			end
		end,
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"intelephense",
				"ts_ls",
				"eslint",
				"clojure_lsp",
				"cssls",
				"fennel_ls",
				"jsonls",
			},
			automatic_enable = true,
			automatic_installation = true,
		},
	},
  {
    "hinell/lsp-timeout.nvim",
    dependencies = { "neovim/nvim-lspconfig" }
  },
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},

				mapping = {
					["<Esc>"] = function(fallback)
						cmp.mapping.close()
						fallback()
					end,
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				},
			})
		end,
	},
}
