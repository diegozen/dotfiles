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
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.ejs = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
        files = { "src/parser.c" },
        requires_generate_from_grammar = true,
      },
      filetype = "ejs",
    }
	end,
}
