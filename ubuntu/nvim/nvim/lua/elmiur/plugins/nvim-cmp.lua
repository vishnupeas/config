return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"onsails/lspkind.nvim", -- vs-code like pictograms
		},
		opts = function()
			local cmp = require("cmp")

			local lspkind = require("lspkind")
			return {
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},

				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),

				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp for autocompletion
					{ name = "path" }, -- file system paths
					{
						{ name = "buffer" }, -- text within current buffer
					},
				}),

				-- configure lspkind for vs-code like pictograms in completion menu
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			}
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"L3MON4D3/LuaSnip", -- snippet engine
		dependencies = {
			{
				"nvim-cmp", -- adding snippets to auto completion
				dependencies = {
					"saadparwaiz1/cmp_luasnip", -- for luasnip to work with nvim-cmp
				},
				opts = function(_, opts)
					opts.snippet = { -- configure how nvim-cmp interacts with snippet engine
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					}

					table.insert(opts.sources, { name = "luasnip" })
				end,
			},
			{
				"rafamadriz/friendly-snippets", -- useful snippets

				config = function()
					-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		config = function()
			-- load custom snippets
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/elmiur/snippets/" })
		end,
	},
}
