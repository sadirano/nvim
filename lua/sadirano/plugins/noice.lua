local ok, local_cfg = pcall(require, "sadirano.local.profiles")
local enabled = ok and local_cfg.ui and local_cfg.ui.noice == true

return {
    "folke/noice.nvim",
    enabled = enabled,
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        })
    end,
}
