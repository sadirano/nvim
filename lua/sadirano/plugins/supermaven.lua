local ok, local_cfg = pcall(require, "sadirano.local.profiles")
local enabled = ok and local_cfg.ui and local_cfg.ui.supermaven == true

return {
    "supermaven-inc/supermaven-nvim",
    enabled = enabled,
    event = "InsertEnter",
    config = function()
        require("supermaven-nvim").setup({})
    end,
}
