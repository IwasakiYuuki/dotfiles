return {
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("telescope").setup {
        defaults = {
          prompt_prefix = "   "
        },
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
      }
      local builtin = require('telescope.builtin')
      local extensions = require('telescope').extensions
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fn', extensions.notify.notify, {})
    end
  },
}
