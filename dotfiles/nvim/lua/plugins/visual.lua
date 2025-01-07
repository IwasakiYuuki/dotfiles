return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      require("catppuccin").setup({
        flavour = "macchiato",
        integrations = {
          cmp = true,
          telescope = true,
          noice = true,
          notify = true,
          nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = true,
          },
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        theme = "catppuccin",
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup({})
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function ()
      require("noice").setup({
      })
    end,
  },
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = true,
  --   event = { "WinNew" },
  -- },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function ()
  --     require("neo-tree").setup({})
  --     vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>")
  --   end
  -- }
  {
    "nvim-tree/nvim-tree.lua",
    config = function ()
      local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-n>',  api.tree.toggle,         opts('Toggle'))
        vim.keymap.set('n', '?',      api.tree.toggle_help,    opts('Help'))
        vim.keymap.del('n', 's', { buffer = bufnr })
      end
      require("nvim-tree").setup({
        on_attach=my_on_attach,
        renderer = {
          highlight_git = "all",
          highlight_diagnostics = "all",
          highlight_modified = "all",
          indent_markers = { enable = true },
          icons = {
            glyphs = {
              git = {
                unstaged = "",
                staged = "",
                unmerged = "",
                renamed = "➜",
                untracked = "",
                deleted = "",
                ignored = "",
              },
            }
          }
        },
        modified = {
          enable = true,
        },
      })
      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
    end,
  }
}
