vim.g.mapleader = " "
vim.g.maplocalleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- Ensure lazy.nvim is installed
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })

  -- Ensure Nerd Font is installed
  local font_path = "~/.local/share/fonts/Ubuntu Mono Nerd Font Complete.ttf"
  if vim.fn.filereadable(font_path) == 0 then
    vim.fn.system({
      "mkdir", "-p", "~/.local/share/fonts"
    })
    vim.fn.system({
      "curl", "-fLo", font_path, "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf"
    })
  end
end
vim.opt.rtp:prepend(lazypath)

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

require("lazy").setup({
  ui = {
    border = "rounded"
  },

  spec = {
    -- [Themes]
    { "ellisonleao/gruvbox.nvim"},
    { "overcache/NeoSolarized",
      config = function () 
        vim.cmd("colorscheme NeoSolarized")
      end},

    -- [Configurations]
    { "tpope/vim-sensible" },
    { "folke/which-key.nvim", config = function () require("which-key").setup() end },

    -- [Shells]
    { "tpope/vim-fugitive" },

    -- [Buffer]
    {
      "chrisgrieser/nvim-early-retirement",
      config = function ()
        require("early-retirement").setup({
          retirementAgeMins = 10,
          minimumBufferNum = 5
        })
      end
    },
    { "nvimdev/dashboard-nvim",
      config = function ()
        require("dashboard").setup({
          theme = "hyper",
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
            }
          }
        })
      end
    },
    { "nvim-lualine/lualine.nvim", opts = { theme = "solarized_light" } },
    { "akinsho/bufferline.nvim", config = function () require("bufferline").setup() end },
    { "folke/noice.nvim",
      dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
      config = function ()
        require("noice").setup({
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
        })
      end
    },
    { "windwp/nvim-ts-autotag", config = function () require("nvim-ts-autotag").setup() end },
    { "lewis6991/gitsigns.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function () require("gitsigns").setup() end 

    },
    { "folke/ts-comments.nvim",
      config = function ()
        require("ts-comments").setup({
          mappings = {
            basic = {
              gcc = function ()
                require("ts-comments").toggle_linewise()
              end,

              gc = function ()
                require("ts-comments").toggle_operator()
              end
            }
          }
})
      end},
    { "echasnovski/mini.ai", config = function () require("mini.ai").setup() end },

    -- [Files, Fuzzy Finding]
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
        { "<leader>p", "<cmd>Telescope git_files<cr>" },
        { "<leader>.", "<cmd>Telescope find_files<cr>" },
        { "<leader>b", "<cmd>Telescope buffers<cr>" },
        { "<leader>g", "<cmd>Telescope live_grep<cr>" },
        { "<leader>m", "<cmd>Telescope marks<cr>" },
        { "?", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
        { "M", "<cmd>Telescope keymaps<cr>" }
      },
      config = function ()
        require("telescope").setup({
          defaults = {
            layout_config = {
              horizontal = {
                preview_cutoff = 0
              }
            },

            mappings = {
              i = {
                ["<esc>"] = require("telescope.actions").close
              }
            }
          }
})
      end
    },
    { "nvim-neo-tree/neo-tree.nvim", dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
      keys = {
        { "<leader>e", "<cmd>Neotree filesystem reveal left toggle<cr>" }
      }
    },
    { "ggandor/leap.nvim", config = function () require("leap").create_default_mappings() end },
    { "kevinhwang91/nvim-bqf" },
    { "mhinz/vim-grepper", keys = { { "<leader>G", "<cmd>Grepper<cr>" } } },
    { "johmsalas/text-case.nvim", config = function () require("textcase").setup() end },

    -- [LSP & Language]
    { "neoclide/coc.nvim", branch = "release" },
    { "neovim/nvim-lspconfig",
      config = function ()
        local lspconfig = require("lspconfig")

        local servers = {
          "intelephense",
          "ts_ls",
          "vuels",
          "html",
          "fennel_ls",
          "eslint",
          "elixirls",
          "dockerls",
          "cssls",
          "vimls"
        }

        for _, server in ipairs(servers) do
          lspconfig[server].setup({
            on_attach = function (client, bufnr)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', { noremap = true })
              vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', { noremap = true })
              vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', { noremap = true })
              vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>d', '<CMD>lua vim.diagnostic.open_float()<CR>', { noremap = true })
              vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<CMD>lua vim.diagnostic.goto_prev()<CR>', { noremap = true })
              vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<CMD>lua vim.diagnostic.goto_next()<CR>', { noremap = true })
            end
          })
        end
      end
    },
    { "williamboman/mason.nvim", config = function () require("mason").setup() end },
    { "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim" },
      config = function ()
        require("mason-lspconfig").setup({ automatic_installation = true })
      end
    },
    { "hrsh7th/nvim-cmp",
      dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
      config = function ()
        local cmp = require("cmp")
        cmp.setup({
          sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" }
          },

          mapping = {
            ["<Esc>"] = function (fallback)
              cmp.mapping.close()
              fallback()
            end,
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
          }
        })
      end
    },
    { "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-neotest/neotest-jest",
        "jfpedroza/neotest-elixir",
        "olimorris/neotest-phpunit"
      },
      config = function ()
        require("neotest").setup({
          adapters = {
            require("neotest-jest")({}),
            require("neotest-phpunit")({}),
            require("neotest-elixir")({}),
          }
        })
      end
    },
    { "tpope/vim-dispatch" },
    { "clojure-vim/vim-jack-in" },
    { "radenling/vim-dispatch-neovim" },
    { "Olical/conjure" },
    { "Olical/aniseed" },
    { "folke/trouble.nvim", config = function () require("gitsigns").setup() end },
    { "stevearc/conform.nvim",
      config = function ()
        require("conform").setup({
          formatters_by_ft = {
            typescript = { "prettier" },
            javascript = { "prettier" }
          }
        })
      end},

    -- [Syntax]
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
      config = function ()
        require("nvim-treesitter.configs").setup({
          -- Ensure these are installed at all times
          ensure_installed = { "javascript", "tsx", "typescript", "vue", "php", "clojure" },

          -- Automatically install parsers
          auto_install = true,
        })
      end
    },
    { "instant-markdown/vim-instant-markdown", ft = "markdown", build = "yarn install" },
  },
})

-- Global Keybindings
vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>", { noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<leader>fs", ":wa<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-v>", "<C-o>p<CR>", { noremap = true, silent = true })

-- Text
vim.keymap.set("n", "<C-a>", "Gvgg", { noremap = true, silent = true })
vim.keymap.set("v", "<TAB>", ">><CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<S-TAB>", "<<<CR>", { noremap = true, silent = true })

-- Window Management
-- vim.keymap.set("n", "<S-k>", ":above split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-j>", ":below split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":vs<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", ":botright vs<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-up>", ":res -1", { noremap = true, silent = true })
vim.keymap.set("n", "<C-down>", ":res +1", { noremap = true, silent = true })
vim.keymap.set("n", "<C-down>", ":res +1", { noremap = true, silent = true })
vim.keymap.set("n", "<C-right>", "<C-W>> +", { noremap = true, silent = true })
vim.keymap.set("n", "<C-left>", "<C-W>< -", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wd", ":q<CR>", { noremap = true, silent = true })

-- Terminal
vim.keymap.set("n", "<leader>ot", ":term<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<localleader>c", "<C-\\><C-n><CR>", { noremap = true, silent = true })
