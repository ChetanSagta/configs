require('plugins')
require('terminal')
require('lsp')
require('treesitter')
require('_telescope')
require('tree')
require('commentor')
require('terminal')
require('onedark').setup {}
require('lualine').setup {}
require('project')
require('keymap')
require('trouble')
require('_dap')
-- require('mason').setup{}
require('fidget').setup{}
require('_gitsigns')

vim.o.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
-- vim.o.tagstack = true

vim.opt.cursorline = true

vim.wo.rnu = true
vim.wo.nu = true
-- vim.cmd('colorscheme onedark')
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd [[ colorscheme onedark ]]
