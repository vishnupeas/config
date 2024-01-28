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
			-- helper function for luasnip/nvim-cmp Super Tab
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local cmp = require("cmp")

			local lspkind = require("lspkind")

			local luasnip = require("luasnip")

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

					-- For Super Tab like mapping - from nvim-cmp mappings
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
						-- that way you will only jump inside the snippet region
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp for autocompletion
					{ name = "path" }, -- file system paths
					{
						-- load only if other sources were not found
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
		opts = {
			-- Enable autotriggered snippets
			enable_autosnippets = true,

			-- Use Tab to trigger visual selection
			store_selection_keys = "<Tab>",
		},
		config = function(_, opts)
			local ls = require("luasnip")

			-- load custom snippets
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/elmiur/snippets/" })

			ls.setup(opts)
		end,
	},
}
