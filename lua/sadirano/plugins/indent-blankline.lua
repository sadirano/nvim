local ok, local_cfg = pcall(require, "sadirano.local.profiles")
local enabled = ok and local_cfg.ui and local_cfg.ui.indent_guides == true

return {
    "lukas-reineke/indent-blankline.nvim",
    enabled = enabled,
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
}
