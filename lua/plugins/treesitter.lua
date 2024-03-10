return {
	-- TreeSitter
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- TreeSitter
		-- To install new parsers, add to the ensure_installed tuple and type :TSInstall
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
