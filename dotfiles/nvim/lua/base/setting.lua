vim.o.number = true
vim.o.relativenumber = true
vim.o.encoding = 'UTF-8'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.laststatus = 3
vim.o.clipboard = "unnamedplus"
vim.o.pumblend = 0
vim.o.exrc = true

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

vim.cmd 'highlight Normal guibg=NONE ctermbg=NONE'
vim.cmd 'highlight NormalNC guibg=NONE ctermbg=NONE'
vim.cmd 'highlight NonText guibg=NONE ctermbg=NONE'
vim.cmd 'highlight Folded guibg=NONE ctermbg=NONE'
vim.cmd 'highlight EndOfBuffer guibg=NONE ctermbg=NONE'
vim.cmd 'highlight NvimTreeNormal guibg=NONE ctermbg=NONE'
vim.cmd 'highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE'
