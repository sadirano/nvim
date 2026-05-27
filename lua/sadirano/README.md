# Sadirano Neovim Configuration

This is a modular and portable Neovim configuration designed for flexibility across different machines and development environments.

## Directory Structure

- `core/`: Fundamental Neovim settings, keymaps, and autocmds.
- `plugins/`: Plugin-specific configurations, managed by `lazy.nvim`.
- `local/`: **(Ignored by git)** Machine-specific overrides for profiles and keymaps.
- `plugins-setup.lua`: Bootstraps `lazy.nvim` and imports plugin modules.

## The Profile System (`core/languages.lua`)

The configuration uses a "Profile" system to manage language-specific tools (LSPs, formatters, linters) dynamically. This prevents installing unnecessary tools on machines where they aren't needed.

### How it Works

1.  **Profiles Definition**: Language profiles are defined in `lua/sadirano/core/languages.lua`. Each profile can specify:
    - `lsp`: LSP servers to enable.
    - `tools`: Binaries to install via Mason (LSPs, formatters, etc.).
    - `formatters`: Formatter configurations for `conform.nvim`.
    - `linters`: Linter configurations for `nvim-lint`.

2.  **Activation**: Profiles are activated by adding their names to the `active_profiles` table.

3.  **Local Overrides**: You can override the active profiles per-machine by creating `lua/sadirano/local/profiles.lua`.

### Example `local/profiles.lua`

```lua
return {
    active_profiles = { "web", "rust", "python" },
    ui = {
        noice = true, -- Enable fancy UI
    }
}
```

## Core Keymaps

- `<leader>e`: Toggle Oil (File Explorer)
- `<leader>ff`: Find files (Telescope)
- `<leader>sg`: Live grep (Telescope)
- `<M-S-f>` (Alt+Shift+f): Format buffer (Conform)
- `<leader>dt`: Toggle diagnostics
- `<leader>lk`: Edit local keymaps
- `<leader>lp`: Edit local profiles
