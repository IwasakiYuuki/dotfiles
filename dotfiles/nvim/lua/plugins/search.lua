return {
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
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
  {
    "rcarriga/nvim-notify",
    config = function ()
      require("notify").setup({
        fps = 60,
        stages = "static"
      })
    end
  },
  {
    "phaazon/hop.nvim",
    config = function()
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({
          direction = directions.AFTER_CURSOR,
          current_line_only = true
        })
      end, {remap=true})
      vim.keymap.set('', 'F', function()
        hop.hint_char1({
          direction = directions.BEFORE_CURSOR,
          current_line_only = true
        })
      end, {remap=true})
      vim.keymap.set('', 't', function()
        hop.hint_char1({
          direction = directions.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1
        })
      end, {remap=true})
      vim.keymap.set('', 'T', function()
        hop.hint_char1({
          direction = directions.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = 1
        })
      end, {remap=true})
      hop.setup({})
    end
  }
}
