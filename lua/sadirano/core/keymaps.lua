local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "x", '"_x', { desc = "Delete char without yanking" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set({ "n", "v" }, "H", "^", { desc = "Jump to line start" })
keymap.set({ "n", "v" }, "L", "$", { desc = "Jump to line end" })

keymap.set("n", "<A-z>", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })

keymap.set("n", "<A-Down>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
keymap.set("n", "<A-Up>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })

keymap.set("n", "cp", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy file path" })

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Prev tab" })

-- buffer navigation
keymap.set("n", "<C-Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Prev buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })

----------------------
-- Plugin Keybinds
----------------------

keymap.set("n", "<leader>e", function()
    require("oil").toggle_float()
end, { desc = "File explorer" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep word under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

-- telescope git
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Commits" })
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { desc = "File commits" })
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Branches" })
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Status" })

keymap.set(
    { "n", "v" },
    "<M-S-f>",
    "<cmd>lua require('conform').format({ async = true })<CR>",
    { desc = "Format buffer" }
)

-- open local files
keymap.set("n", "<leader>lk", function()
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/sadirano/local/keymaps.lua")
end, { desc = "Edit local keymaps" })
keymap.set("n", "<leader>lp", function()
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/sadirano/local/profiles.lua")
end, { desc = "Edit local profiles" })

keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })

keymap.set("n", "<leader>dt", "<cmd>ToggleDiagnostics<CR>", { desc = "Toggle diagnostics" })
