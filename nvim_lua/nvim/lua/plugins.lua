local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
  use "terrortylor/nvim-comment"
  use { 'dracula/vim', as = 'dracula' }
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua' --nvim lua api
  use {
    's1n7ax/nvim-terminal',
  }
  use({ 'monsonjeremy/onedark.nvim', branch = 'treesitter' })
  use {
    'nvim-lualine/lualine.nvim',
    'folke/trouble.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'ahmedkhalf/project.nvim'
  use 'simrat39/rust-tools.nvim'
  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  -- use 'romgrk/barbar.nvim'
  use "williamboman/mason.nvim"
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require("fidget").setup {
        -- options
      }
    end,
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
