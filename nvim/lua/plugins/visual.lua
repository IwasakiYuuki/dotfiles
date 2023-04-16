return {
  {
    "catppuccin/nvim",
    config = function ()
      require("catppuccin").setup({
        flavour = "mocha",
        term_colors = true,
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
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
      })
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
  }
}
