# ⚡️ TurboVim

Lightweight and fast Neovim configuration optimized for performance and usability.

## 🎯 Philosophy

- Lightweight plugins with performance optimizations
- Clean and intuitive interface
- Fast startup with smart lazy loading
- Essential tools without bloat

## ⚡️ Plugins

Carefully selected and optimized plugins:

- **Interface & Navigation**
  - tokyonight (beautiful minimalist theme)
  - lualine (lightweight status line)
  - neo-tree (fast file manager)
  - alpha-nvim (clean dashboard)
  - indent-blankline (minimal visual indents)

- **Development Tools**
  - telescope (fuzzy finder with performance tweaks)
  - copilot (AI code completion)
  - treesitter (syntax highlighting)
  - conform (code formatting)
  - gitsigns (git integration)
  - comment (smart commenting)
  - todo-comments (TODO highlighting)
  - editorconfig (consistent coding style)

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

### Leader Key: `Space`

### File Management
- `<leader>e` - Toggle file manager (Neo-tree)
- `<leader>o` - Focus file manager
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files
- `<leader>fe` - File browser

### Basic Operations
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>c` - Close buffer
- `<leader>f` - Format code
- `Esc` - Clear search highlights

### Window Navigation
- `Ctrl+h` - Move to left window
- `Ctrl+j` - Move to bottom window
- `Ctrl+k` - Move to top window
- `Ctrl+l` - Move to right window

### Development
- `Tab` - Accept Copilot suggestion
- `gcc` - Comment/uncomment line
- `]c` / `[c` - Next/previous git change
- `]t` / `[t` - Next/previous TODO comment

### Git
- `<leader>fc` - Git commits
- `<leader>fs` - Git status

## 🛠 Requirements

- Neovim >= 0.10.0
- git
- ripgrep (for telescope search)
- nodejs (for copilot)
- Nerd Font (for icons)
- make (for telescope-fzf-native compilation)

## ⚡️ Performance Features

- **Optimized startup**: Disabled unnecessary built-in plugins
- **Smart caching**: Plugin cache enabled for faster loading
- **Minimal UI**: Streamlined status line and file manager
- **Fast updates**: Reduced timeouts and update intervals
- **Syntax optimization**: Limited syntax highlighting for large files
