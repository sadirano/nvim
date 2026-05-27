local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.showmode = false
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 5
opt.winborder = "rounded"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- splits
opt.splitright = true
opt.splitbelow = true

-- persistent undo (no swap/backup files)
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- faster CursorHold (improves gitsigns responsiveness)
opt.updatetime = 250
