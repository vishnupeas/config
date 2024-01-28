return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		-- provide a list of |regular-expression|s for filtering out undesired errors and warnings.
		vim.g.vimtex_quickfix_ignore_filters = {
			"test text",
		}

		-- Control whether or not to automatically open the quickfix window in case there are warning messages and no error messages
		vim.g.vimtex_quickfix_open_on_warning = 0

		-- Use this option to disable/enable syntax highlighting as provided by VimTeX.
		-- vim.g.vimtex_syntax_enabled = 0
		-- vim.g.vimtex_syntax_conceal_disable = 1

		-- change graphic interface
		vim.g.vimtex_view_general_viewer = "okular"
	end,
}
