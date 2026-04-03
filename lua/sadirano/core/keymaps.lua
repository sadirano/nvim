local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- exit insert mode
keymap.set("i", "jk", "<ESC>")

-- save
keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("i", "<C-s>", "<Esc>:w<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- jump to line start/end
keymap.set({ "n", "v" }, "H", "^")
keymap.set({ "n", "v" }, "L", "$")

-- toggle line wrap
keymap.set("n", "<A-z>", "<cmd>set wrap!<CR>")

-- move lines up/down in visual mode
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- copy current file path to clipboard
keymap.set("n", "cp", '<cmd>let @+ = expand("%")<CR>')

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- buffer navigation
keymap.set("n", "<C-Tab>", "<cmd>bnext<CR>")
keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>")
keymap.set("n", "<leader>bd", "<cmd>bd<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- oil file explorer
keymap.set("n", "<leader>e", "<cmd>lua require('oil').open_float()<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- telescope git
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

-- lsp restart
keymap.set("n", "<leader>rs", ":LspRestart<CR>")
