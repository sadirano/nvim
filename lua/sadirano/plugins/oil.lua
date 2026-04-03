vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
        vim.opt_local.colorcolumn = ""
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil_preview",
    callback = function(params)
        vim.keymap.set("n", "<CR>", function()
            require("oil").open()
        end, { buffer = params.buf, nowait = true })
    end,
})

return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            float = {
                relative = "editor",
                width = 0.8,
                height = 0.8,
                border = "rounded",
            },
            confirmation = {
                border = "rounded",
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-\\>"] = "actions.select_vsplit",
                ["<C-s>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["q"] = "actions.close",
                ["<C-r>"] = "actions.refresh",
                ["<BS>"] = "actions.parent",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
            },
            use_default_keymaps = false,
        })
    end,
}
