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
vim.opt.conceallevel = 1

-- This line loads lua/vim-options.lua file
require("vim-options")
-- This line loads lua/plugins/ files
require("lazy").setup("plugins")
-- Telekasten
require('telekasten').setup({
    home = vim.fn.expand("~/docs"), -- Put the name of your notes directory here
    take_over_my_home = false
})

-- Toggle Terminal
vim.api.nvim_set_keymap('n', '<Leader>t', ':ToggleTerm<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', [[<C-w>]], { noremap = true })

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = vim.fn.expand('*/docs/vaults/*'),
    callback = function()
        vim.cmd("set filetype=markdown")
--        vim.cmd("set syntax=telekasten")
    end
})

-- Treesitter markdown format internal links
-- Define the custom highlight group
vim.cmd [[
  highlight InternalLink guifg=LightMagenta
  highlight CodeBlock guibg=NONE
  highlight InlineCode guifg=#ff9999
  highlight LineNr guibg=#aaaaaa guifg=#ffffff
]]

-- Link the Treesitter highlight group to the custom highlight group
vim.api.nvim_set_hl(0, 'TSTag', { link = 'InternalLink' })
vim.api.nvim_set_hl(0, 'TSTag', { link = 'CodeBlock' })
vim.api.nvim_set_hl(0, 'TSTag', { link = 'InlineCode' })

-- Set conceal level and character, and enable conceal for Markdown files
vim.opt.conceallevel = 2

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd [[
      syntax region InlineCode start=/`/ end=/`/
      syntax region CodeBlock start=/```/ end=/```/
      syntax match InternalLink /\[\[.\{-}\]\]/ contains=InternalLinkText containedin=ALLBUT,InlineCode,CodeBlock
      syntax region InternalLinkText matchgroup=InternalLink start=/\[\[/ end=/\]\]/ concealends contained
    ]]
    vim.cmd [[
      highlight link InternalLinkText InternalLink
      " highlight default CodeBlock ColorColumn
    ]]
  end,
})
