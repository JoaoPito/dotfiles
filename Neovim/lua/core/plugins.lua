
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- lazy.nvim setup
-- Install your lazy.nvim plugins here
require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "nvim-tree/nvim-tree.lua", name = "nvim-tree"},
  { "nvim-tree/nvim-web-devicons", name = "nvim-web-devicons"},
  { "nvim-lualine/lualine.nvim", name = "lualine"},
  { "nvim-treesitter/nvim-treesitter", name = "treesitter"},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "folke/neodev.nvim",
})

