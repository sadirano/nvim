vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.opt_local.colorcolumn = ""
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil_preview",
  callback = function(params)
    vim.keymap.set("n", "<CR>", "o", { buffer = params.buf, remap = true, nowait = true })
  end,
})

return {
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-\\>"] = "actions.select_vsplit",
          ["<C-enter>"] = "actions.select_split", -- this is used to navigate left
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["q"] = "actions.close",
          ["<C-r>"] = "actions.refresh",
          ["<backspace>"] = "actions.parent",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["``"] = "actions.cd",
          ["~~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
        },
        confirmation = {
          border = "rounded",
          win_options = { winblend = 0 },
        },
        is_git_dirty = true,
        use_default_keymaps = false,
      })
    end,
  },
}
