return {
  {
    "tpope/vim-commentary",
  },
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  },
  {
    "jiangmiao/auto-pairs"
  },
  {
    "machakann/vim-sandwich"
  },
  {
    "akinsho/toggleterm.nvim",
    config = function ()
      require("toggleterm").setup {
        size = 30,
        shade_terminals = false
      }
      vim.api.nvim_create_autocmd({"TermEnter"}, {
        pattern = {"term://*toggleterm#*"},
        callback = function ()
          vim.keymap.set("t", "<C-t>", "<cmd>exe v:count1 . 'ToggleTerm'<cr>", { silent = true })
        end
      })
      vim.keymap.set("n", "<C-t>", "<cmd>exe v:count1 . 'ToggleTerm'<cr>", { silent = true })
      vim.keymap.set("i", "<C-t>", "<cmd>exe v:count1 . 'ToggleTerm'<cr>", { silent = true })
    end
  },
}
