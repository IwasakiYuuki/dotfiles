vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- FileType Indent
augroup('setIndent', { clear = true })
-- 4 spaces (default)
autocmd(
  'FileType',
  {
    group = 'setIndent',
    pattern = '*',
    callback = function()
      vim.bo.sw = 4
      vim.bo.sts = 4
      vim.bo.ts = 4
    end
  }
)
-- 2 spaces
autocmd(
  'FileType',
  {
    group = 'setIndent',
    pattern = { 'sh', 'vim', 'lua', 'yaml', 'toml', 'sql', 'html', 'css', 'javascript', 'typescript', 'markdown' },
    callback = function()
      vim.bo.sw = 2
      vim.bo.sts = 2
      vim.bo.ts = 2
    end
  }
)
