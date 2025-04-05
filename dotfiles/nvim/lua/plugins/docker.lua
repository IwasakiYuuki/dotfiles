return {
  {
    "crnvl96/lazydocker.nvim",
    dependencies = {
			"MunifTanjim/nui.nvim",
		},
    config = function()
      require("lazydocker").setup({})
      vim.keymap.set("n", "<leader>dd", "<cmd>LazyDocker<CR>")
    end,
  }
}
