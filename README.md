# ⚡️ TurboVim

Minimalist and fast Neovim configuration built on the principles of simplicity and efficiency.

## 🎯 Philosophy

- Minimal plugins, maximum efficiency
- Simple and clear configuration structure
- Quick start without unnecessary settings
- Only the most essential tools

## ⚡️ Plugins

A basic set of carefully selected plugins:

- **Interface**

  - tokyonight (beautiful and minimalist theme)
  - lualine (status line)
  - indent-blankline (visual indents)
  - todo-comments (TODO highlighting)

- **Development**
  - telescope (fuzzy finder)
  - copilot (AI code completion)
  - treesitter (advanced syntax highlighting)
  - conform (formatting)
  - gitsigns (git integration)
  - comment (smart comments)

## 📁 Structure

```
.
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin versions
└── lua
    ├── config             # Basic configuration
    │   ├── colorscheme.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins           # Plugin settings
        ├── *.lua        # One file per plugin
```

## ⚙️ Installation

```bash
# Backup current config
mv ~/.config/nvim ~/.config/nvim.bak

# Install TurboVim
git clone git@github.com:denisfl/turbo-vim.git ~/.config/nvim

# First launch will install all plugins automatically
nvim
```

## 🗺 Key Bindings

- `Space` - leader key
- `<leader>ff` - find files
- `<leader>fg` - find text
- `<leader>f` - format code
- `Tab` - accept Copilot suggestion
- `gcc` - comment line
- `]c` / `[c` - next/previous git change
- `]t` / `[t` - next/previous TODO comment

## 🛠 Requirements

- Neovim >= 0.9.0
- git
- ripgrep (for telescope)
- nodejs (for copilot)
- Nerd Font
