return {
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "|",
      options = { try_as_border = true }
    }
  },
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},

	{
		"nvimdev/dashboard-nvim",
		opts = {
			theme = "doom",
			config = {
				header = {
					[[                                              ]],
					[[           _____                      _____   ]],
					[[          /\    \                    /\    \  ]],
					[[         /::\____\                  /::\____\ ]],
					[[        /::::|   |                 /:::/    / ]],
					[[       /:::::|   |                /:::/    /  ]],
					[[      /::::::|   |               /:::/    /   ]],
					[[     /:::/|::|   |              /:::/    /    ]],
					[[    /:::/ |::|   |             /:::/    /     ]],
					[[   /:::/  |::|___|______      /:::/    /      ]],
					[[  /:::/   |::::::::\    \    /:::/    /       ]],
					[[ /:::/    |:::::::::\____\  /:::/____/        ]],
					[[ \::/    / ~~~~~/:::/    /  \:::\    \        ]],
					[[  \/____/      /:::/    /    \:::\    \       ]],
					[[              /:::/    /      \:::\    \      ]],
					[[             /:::/    /        \:::\    \     ]],
					[[            /:::/    /          \:::\    \    ]],
					[[           /:::/    /            \:::\    \   ]],
					[[          /:::/    /              \:::\    \  ]],
					[[         /:::/    /                \:::\____\ ]],
					[[         \::/    /                  \::/    / ]],
					[[          \/____/                    \/____/  ]],
					[[                                              ]],
				},

				center = {
					{
						action = "Telescope find_files",
						desc = " Find File",
						icon = " ",
						key = "f",
					},
					{
						action = "ene | startinsert",
						desc = " New File",
						icon = " ",
						key = "n",
					},
					{
						action = "Telescope oldfiles",
						desc = " Recent Files",
						icon = " ",
						key = "r",
					},
					{
						action = "Telescope live_grep",
						desc = " Find Text",
						icon = " ",
						key = "g",
					},
					{
						action = [[lua LazyVim.telescope.config_files()()]],
						desc = " Config",
						icon = " ",
						key = "c",
					},
					{
						action = 'lua require("persistence").load()',
						desc = " Restore Session",
						icon = " ",
						key = "s",
					},
					{
						action = "LazyExtras",
						desc = " Lazy Extras",
						icon = " ",
						key = "x",
					},
					{
						action = "Lazy",
						desc = " Lazy",
						icon = "󰒲 ",
						key = "l",
					},
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return {
						"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
					}
				end,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			-- Ensure these are installed at all times
			ensure_installed = { "javascript", "tsx", "typescript", "vue", "php", "clojure" },

			-- Automatically install parsers
			auto_install = true,
		},
	},
}
