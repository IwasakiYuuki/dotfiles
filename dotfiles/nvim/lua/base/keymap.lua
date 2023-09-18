-- GENERAL
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set({'n', 'v'}, ';', ':')
vim.keymap.set('n', '<S-a>', '^i')
vim.keymap.set('n', '<S-s>', '$a')

-- WINDOW
-- move
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- split
vim.keymap.set('n', 'ss', '<cmd>new<cr>')
vim.keymap.set('n', 'sv', '<cmd>vnew<cr>')
vim.keymap.set('n', 'sq', '<cmd>q<cr>')

-- TAB
vim.keymap.set('n', 'to', '<cmd>tabnew<cr>')
vim.keymap.set('n', 'tn', '<cmd>tabn<cr>')
vim.keymap.set('n', 'tp', '<cmd>tabp<cr>')
vim.keymap.set('n', 'tc', '<cmd>tabclose<cr>')

-- SEARCH & REPLACE
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')
vim.keymap.set('n', 'g*', 'g*zz')
vim.keymap.set('n', 'g#', 'g#zz')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('v', ':s', ':s/\\v')

-- LSP action
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end)

-- UTILITY
vim.keymap.set('n', '<Leader>sv', '<cmd>luafile %<cr>')
