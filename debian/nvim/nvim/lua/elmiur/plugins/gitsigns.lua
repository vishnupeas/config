return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
	},
	keys = {},
	config = function(_, opts)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end)

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end)

		-- Actions
		map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Git Preview hunk" })

		map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Git stage hunk" })
		map("n", "<leader>ghu", gitsigns.undo_stage_hunk, { desc = "Git undo stage hunk" })
		map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Git reset hunk" })
		map("v", "<leader>ghs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Git stage hunk" })
		map("v", "<leader>ghr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Git reset hunk" })

		map("n", "<leader>gbs", gitsigns.stage_buffer, { desc = "Git stage buffer" })
		map("n", "<leader>gbr", gitsigns.reset_buffer, { desc = "Git reset buffer" })

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")

		gitsigns.setup(opts)
	end,
}
