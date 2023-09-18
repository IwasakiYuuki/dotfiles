return {
  {
    "tpope/vim-commentary",
  },
  -- {
  --   "IwasakiYuuki/ai-assistant.nvim",
  --   branch = "develop",
  --   build = ":UpdateRemotePlugins",
  -- }
  {
    "jackMort/ChatGPT.nvim",
    config = function ()
      require("chatgpt").setup({
        keymaps = {
          submit = "<C-s>"
        }
      })
    end
  }
}
