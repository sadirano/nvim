local ok, local_cfg = pcall(require, "sadirano.local.profiles")
local enabled = ok and local_cfg.ui and local_cfg.ui.which_key == true

return {
    "folke/which-key.nvim",
    enabled = enabled,
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup()
        wk.add({
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>l", group = "local" },
            { "<leader>s", group = "split/search" },
            { "<leader>t", group = "tabs" },
            { "<leader>b", group = "buffer" },
            { "<leader>d", group = "diagnostics" },
            { "<leader>r", group = "lsp" },
            { "<leader>v", group = "workspace" },
            { "<leader>c", group = "code" },
        })
    end,
}
