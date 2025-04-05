# Dotfiles
Automated environment builder using Ansible

### Requirements

- Ansible
- python3 and pip

### Install
```
git clone https://github.com/IwasakiYuuki/dotfiles
cd dotfiles
ansible-playbook -i localhost, -c local setup.yaml --ask-become-pass
```

### Neovim Plugins

- completion
  - zbirenbaum/copilot.lua: Github Copilot
  - zbirenbaum/copilot-cmp: Github Copilot dependencies
  - hrsh7th/nvim-cmp: Nvim Completion engine
  - hrsh7th/cmp-nvim-lsp: LSP source for nvim-cmp
  - hrsh7th/cmp-buffer: buffer completions for nvim-cmp
  - hrsh7th/cmp-path: path completions for nvim-cmp
  - hrsh7th/cmp-cmdline: cmdline completions for nvim-cmp
  - onsails/lspkind.nvim: Icons for nvim-cmp
  - SirVer/ultisnips: Snippet engine (refferd from nvim-cmp)
  - honza/vim-snippets: Snippets collection
- diagnostics
  - folke/trouble.nvim: Diagnostics list
  - nvim-tree/nvim-web-devicons: Icons for nvim
  - jose-elias-alvarez/null-ls.nvim: Diagnostics and formatting
  - jay-babu/mason-null-ls.nvim: Null-ls integration with mason
- git
  - lewis6991/gitsigns.nvim: Visualize git status in buffer
  - kdheepak/lazygit.nvim: Lazygit integration
- docker
  - crnvl96/lazydocker.nvim: LazyDocker integration
- highlight
  - nvim-treesitter/nvim-treesitter: Syntax highlighting
  - nvim-treesitter/nvim-treesitter-textobjects: Text objects for treesitter
- lsp
  - williamboman/mason.nvim: Manager of LSP, DAP, Linter, Formatter
  - williamboman/mason-lspconfig.nvim: Integration with mason and lspconfig
  - neovim/nvim-lspconfig: LSP configuration
  - simrat39/symbols-outline.nvim: Outline of symbols
  - mfussenegger/nvim-dap: Debug Adapter Protocol
  - rcarriga/nvim-dap-ui: UI for nvim-dap
  - nvim-neotest/nvim-nio: Dependency for nvim-dap-ui
  - jay-babu/mason-nvim-dap.nvim: DAP integration with mason
- search
  - nvim-lua/plenary.nvim: Dependency for telescope
  - nvim-telescope/telescope.nvim: Fuzzy finder
  - phaazon/hop.nvim: Jump to word
  - rcarriga/nvim-notify: Notifications
- ai
  - yetone/avante.nvim: AI Chat, Edit
- visual
  - catppuccin/nvim: Colorscheme
  - nvim-lualine/lualine.nvim: Statusline
  - lukas-reineke/indent-blankline.nvim: Indent guides
  - folke/noice.nvim: UI for messages, cmdline and popupmenu
  - nvim-tree/nvim-tree.lua: File explorer
  - MeanderingProgrammer/render-markdown.nvim: Markdown preview
- utils
  - tpope/vim-commentary: Comment out code
  - Wansmer/treesj: Join and split text objects
  - jiangmiao/auto-pairs: Auto close brackets
  - machakann/vim-sandwich: Surround text objects
  - akinsho/toggleterm.nvim: Open terminal in nvim
