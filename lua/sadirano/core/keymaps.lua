local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

keymap.set("n", "<leader>no", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "x", '"_x', { desc = "Delete char without yanking" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<A-z>", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })

-- Visual movement (both arrows and j/k)
keymap.set("n", "<A-Down>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
keymap.set("n", "<A-Up>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

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
keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Quit window" })

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Prev tab" })

-- buffer navigation
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Prev buffer" })
keymap.set("n", "<leader>bd", function()
    vim.notify("DEPRECATED: Use <leader>wq instead", vim.log.levels.WARN)
    vim.cmd("bd")
end, { desc = "Close buffer (Deprecated)" })

-- Quickfix
keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix" })
keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix" })
keymap.set("n", "<leader>qn", ":cnext<CR>zz", { desc = "Next quickfix" })
keymap.set("n", "<leader>qp", ":cprev<CR>zz", { desc = "Prev quickfix" })

keymap.set("n", "<leader>co", function()
    vim.notify("DEPRECATED: Use <leader>qo instead", vim.log.levels.WARN)
    vim.cmd("copen")
end, { desc = "Open quickfix (Deprecated)" })

keymap.set("n", "<leader>cc", function()
    vim.notify("DEPRECATED: Use <leader>qc instead", vim.log.levels.WARN)
    vim.cmd("cclose")
end, { desc = "Close quickfix (Deprecated)" })

keymap.set("n", "<leader>cn", function()
    vim.notify("DEPRECATED: Use <leader>qn instead", vim.log.levels.WARN)
    vim.cmd("cnext")
    vim.cmd("normal! zz")
end, { desc = "Next quickfix (Deprecated)" })

keymap.set("n", "<leader>cp", function()
    vim.notify("DEPRECATED: Use <leader>qp instead", vim.log.levels.WARN)
    vim.cmd("cprev")
    vim.cmd("normal! zz")
end, { desc = "Prev quickfix (Deprecated)" })

----------------------
-- Plugin Keybinds
----------------------

keymap.set("n", "<leader>e", function()
    require("oil").toggle_float()
end, { desc = "File explorer" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep word under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
keymap.set("n", "<leader>?", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in buffer" })
keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "Search diagnostics" })
keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps" })

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
keymap.set("n", "<leader>km", function()
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/sadirano/core/keymaps.lua")
end, { desc = "Edit core keymaps" })

keymap.set("n", "<leader>pm", function()
    vim.notify("DEPRECATED: Use <leader>lp instead", vim.log.levels.WARN, { title = "Profiles" })
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/sadirano/local/profiles.lua")
end, { desc = "Edit local profiles (Deprecated)" })

keymap.set("n", "<leader>lk", function()
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/sadirano/local/keymaps.lua")
end, { desc = "Edit local keymaps" })

keymap.set("n", "<leader>lp", function()
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/sadirano/local/profiles.lua")
end, { desc = "Edit local profiles" })

keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })

keymap.set("n", "<leader>dt", "<cmd>ToggleDiagnostics<CR>", { desc = "Toggle diagnostics" })
