vim.g.mapleader = " "
require("sadirano.plugins-setup")
require("sadirano.core.options")
require("sadirano.core.keymaps")
require("sadirano.core.autocmds")
pcall(require, "sadirano.local.keymaps")
