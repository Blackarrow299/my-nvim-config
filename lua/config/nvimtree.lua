-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<space-e>', api.tree.focus,        opts('Focus'))
end

require("nvim-tree").setup{
  on_attach = my_on_attach,
}

vim.api.nvim_set_keymap('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', '<Cmd>NvimTreeFocus<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<C-w>j', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
