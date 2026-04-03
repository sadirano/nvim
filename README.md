# nvim

My personal Neovim configuration — minimal, modern, and opinionated.

## Requirements

- Neovim >= 0.11
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- `make` or `cmake` (for telescope-fzf-native)
- Node.js (for TypeScript LSP and Prettier)

## Installation

**Linux / macOS**
```bash
git clone https://github.com/sadirano/nvim ~/.config/nvim
```

**Windows**
```pwsh
git clone https://github.com/sadirano/nvim $env:LOCALAPPDATA\nvim
```

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) installs all plugins automatically. LSP servers, formatters, and linters are installed via Mason on startup — no manual steps needed.

## Plugins

| Category | Plugin |
|---|---|
| Plugin manager | lazy.nvim |
| Colorscheme | tokyonight |
| File explorer | oil.nvim |
| Fuzzy finder | telescope.nvim |
| Statusline | lualine.nvim |
| Syntax | nvim-treesitter |
| LSP | nvim-lspconfig + mason |
| Completion | nvim-cmp + LuaSnip |
| Formatting | conform.nvim |
| Linting | nvim-lint |
| Git | gitsigns + vim-fugitive |
| Commenting | Comment.nvim |
| Autopairs | nvim-autopairs + nvim-ts-autotag |
| Surround | nvim-surround |
| Indent guides | indent-blankline |
| LSP progress | fidget.nvim |

## Keymaps

Leader key: `Space`

### General
| Key | Action |
|---|---|
| `<C-s>` | Save |
| `<A-z>` | Toggle line wrap |
| `H` / `L` | Jump to line start / end |
| `<A-j>` / `<A-k>` | Move selected lines down / up |
| `cp` | Copy current file path |

### Windows & Buffers
| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>sv` / `sh` | Split vertical / horizontal |
| `<leader>se` / `sx` | Equalize / close split |
| `<C-Tab>` / `<S-Tab>` | Next / prev buffer |
| `<leader>bd` | Delete buffer |

### File Explorer (oil.nvim)
| Key | Action |
|---|---|
| `<leader>e` | Open file explorer (float) |
| `<CR>` | Open file |
| `-` / `<BS>` | Go to parent directory |
| `g.` | Toggle hidden files |
| `<C-p>` | Preview |
| `q` / `<C-c>` | Close |

### Telescope
| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fs` | Live grep |
| `<leader>fc` | Grep word under cursor |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |

### LSP
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gR` | References |
| `K` | Hover documentation |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>d` | Line diagnostics |
| `<leader>D` | File diagnostics |
| `[d` / `]d` | Prev / next diagnostic |
| `<leader>rs` | Restart LSP |

### Git
| Key | Action |
|---|---|
| `<leader>gc` | Git commits |
| `<leader>gfc` | File commits |
| `<leader>gb` | Git branches |
| `<leader>gs` | Git status |
