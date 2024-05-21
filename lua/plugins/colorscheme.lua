return {
  -- Nord Theme
  "shaunsingh/nord.nvim", name = "nord", priority = 1000,
  config = function()
    vim.cmd.colorscheme "nord"
  end
}

-- return {
--   -- Catppuccin Theme
--   "catppuccin/nvim", name = "catppuccin", priority = 1000,
--    config = function()
--      vim.cmd.colorscheme "catppuccin"
--    end
--  }
