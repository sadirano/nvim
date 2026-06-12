return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = require("gitsigns")
                    local opts = { buffer = bufnr }
                    local function map(mode, l, r, desc)
                        vim.keymap.set(mode, l, r, vim.tbl_extend("force", opts, { desc = desc }))
                    end

                    -- Navigation (falls back to diff-mode ]c/[c when in a diff view)
                    map("n", "]h", function()
                        if vim.wo.diff then vim.cmd.normal({ "]c", bang = true }) else gs.nav_hunk("next") end
                    end, "Next hunk")
                    map("n", "[h", function()
                        if vim.wo.diff then vim.cmd.normal({ "[c", bang = true }) else gs.nav_hunk("prev") end
                    end, "Prev hunk")
                    map("n", "]H", function() gs.nav_hunk("last") end, "Last hunk")
                    map("n", "[H", function() gs.nav_hunk("first") end, "First hunk")

                    -- Staging
                    map({ "n", "v" }, "<leader>hs", gs.stage_hunk, "Stage hunk")
                    map({ "n", "v" }, "<leader>hr", gs.reset_hunk, "Reset hunk")
                    map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
                    map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
                    map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

                    -- Inspection
                    map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
                    map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
                    map("n", "<leader>hd", gs.diffthis, "Diff this")
                    map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff this ~HEAD")

                    -- Toggles
                    map("n", "<leader>ht", gs.toggle_current_line_blame, "Toggle line blame")
                    map("n", "<leader>hx", gs.toggle_deleted, "Toggle deleted")

                    -- Text object: select hunk in operator/visual mode
                    map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
                end,
            })
        end,
    },
}
