require('keymap')
require('plugins')
require('lsp')
require('treesitter')
require('_telescope')
require('tree')
require('commentor')

vim.o.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.cursorline = true

vim.wo.rnu=true
vim.wo.nu= true 
vim.cmd('colorscheme dracula')

