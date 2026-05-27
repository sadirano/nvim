local langs = require("sadirano.core.languages")
local ok, local_cfg = pcall(require, "sadirano.local.profiles")
local enabled = false

-- Enabled if local config says so OR if the 'sadirano' master profile is active
if ok and local_cfg.ui and local_cfg.ui.noice == true then
    enabled = true
elseif langs then
    for _, profile in ipairs(langs.active_profiles) do
        if profile == "sadirano" then
            enabled = true
            break
        end
    end
end

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
