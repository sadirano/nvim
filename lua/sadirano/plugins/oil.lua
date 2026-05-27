vim.api.nvim_create_autocmd("filetype", {
    pattern = "oil",
    callback = function()
        vim.opt_local.colorcolumn = ""
    end,
})

vim.api.nvim_create_autocmd("filetype", {
    pattern = "oil_preview",
    callback = function(params)
        vim.keymap.set("n", "<cr>", "o", { buffer = params.buf, remap = true, nowait = true })
    end,
})

return {
    {
        "stevearc/oil.nvim",
        opts = {},
        -- optional dependencies
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            {
                "SirZenith/oil-vcs-status",
                opts = {},
            },
        },
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                    "size",
                },
                float = {
                    padding = 2,
                    max_width = 0.8,
                    max_height = 0.8,
                    border = "rounded",
                    win_options = { winblend = 0 },
                },
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<cr>"] = "actions.select",
                    ["<c-\\>"] = "actions.select_vsplit",
                    ["<c-enter>"] = "actions.select_split", -- this is used to navigate left
                    ["<c-t>"] = "actions.select_tab",
                    ["<c-p>"] = "actions.preview",
                    ["<c-c>"] = "actions.close",
                    ["q"] = "actions.close",
                    ["<c-r>"] = "actions.refresh",
                    ["<backspace>"] = "actions.parent",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["``"] = "actions.cd",
                    ["~~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                },
                use_default_keymaps = false,
            })
        end,
    },
}
