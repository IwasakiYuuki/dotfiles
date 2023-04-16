return {
  {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.keymap.set("n", "<Leader>gg", "<cmd>LazyGit<cr>")
    end
  }
}
