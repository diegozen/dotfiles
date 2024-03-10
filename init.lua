-- Standard codeblock for installing LazyNvim. It is a plugin manager, there is other options such as VimPlug, Packer, etc
-- Install plugin manager. I am using LazyNvim
-- To open, type :Lazy
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

-- This line loads lua/vim-options.lua file
require("vim-options")
-- This line loads lua/plugins/ files
require("lazy").setup("plugins")
