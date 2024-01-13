-- open explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.E, {desc= "Open Explorer"})

-- move text in select mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z",{ desc = "Stack lines" }) -- don't move cursor while J towards end is used
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keep the cursor in the middle as pagedown
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keep the cursor in the middle as pageup
vim.keymap.set("n", "n", "nzzzv", { desc = "keep search terms in the middle along with cursor"}) -- keep search terms in the middle along with cursor
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep search terms in the middle along with cursor"}) -- keep search terms in the middle along with cursor

-- paste on top doesn't copy the text that is being pasted on to the buffer
vim.keymap.set("x", "<leader>p", [["_dp]], { desc = "paste into null register"})

 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "yank the selection to clipboard" }) -- yank the selection to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank one line to clipboard" }) -- yank the line to clipboard

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "delete with null register" })

-- remaping ctrl+c to be esc so that it works in visual block mode
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>") -- don't press Q as it invokes unintended
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- exec :source/:so command
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, {desc = "exec :source in cmd"})
