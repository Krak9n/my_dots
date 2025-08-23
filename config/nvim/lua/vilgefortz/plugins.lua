local ensure_packer = function()
  local fn = vim.fn local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use '~/stuff/mary'
  use 'wbthomason/packer.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'bluz71/vim-moonfly-colors'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
    end,
  }
  use {
    "dmtrKovalenko/fff.nvim",
   run = "cargo build --release", 
    -- or if you are using nixos
    -- build = "nix run .#release",
  }
  --[[
  use{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = {{'nvim-lua/plenary.nvim'}}
  }
  --]]
  -- packer
  if packer_bootstrap then
    require('packer').sync()
  end
end)
