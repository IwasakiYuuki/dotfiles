return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.keymap.set("n", "<Leader>gg", "<cmd>LazyGit<cr>")
    end
  }
}
