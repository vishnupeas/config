-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentations
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "·" }

-- indenting
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- cursor line
vim.opt.cursorline = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- split settings
vim.opt.splitright = true
vim.opt.splitbelow = true

-- history settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search settings
vim.opt.incsearch = true

-- appearance
vim.opt.termguicolors = true
vim.opt.scrolloff = 8 -- limit the scroll to x char above and below
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"

-- refresh
vim.opt.updatetime = 50

-- word settings
vim.opt.iskeyword:append("-") -- make it part of the word
vim.opt.spelllang = "en_us" -- set spell checking language
vim.opt.spell = true -- enable spell checking
