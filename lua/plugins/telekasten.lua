return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    -- Custom highlight settings
    vim.cmd([[
  hi tkLink ctermfg=DarkGray cterm=bold,underline guifg=DarkGray gui=bold,underline
  hi tkBrackets ctermfg=LightMagenta guifg=LightMagenta
]])
  end,
}
