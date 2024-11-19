-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded

-- [[ Setting options ]]
require('config.options')

-- [[ Basic Keymaps ]]
require('config.keymaps')

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup("plugins", {
  defaults = {
    lazy = false,
    -- Version will be used for plugins without a version specifier
    version = "*"
  },
  install = {
    -- Try to load colorscheme when installing plugins
    colorscheme = { "tokyonight" },
  },
  checker = {
    -- Automatically check for plugin updates
    enabled = true,
    notify = true,
    -- Check for updates every week
    frequency = 604800,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      -- Disable some built-in vim plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure colorscheme ]]
vim.cmd[[colorscheme tokyonight]]

