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
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require("neo-tree").setup({})
      vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>")
    end
  }
}
