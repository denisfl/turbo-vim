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
  - [tokyonight](https://github.com/folke/tokyonight.nvim) - Beautiful minimalist theme
  - [lualine](https://github.com/nvim-lualine/lualine.nvim) - Lightweight status line
  - [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - Fast file manager
  - [alpha-nvim](https://github.com/goolord/alpha-nvim) - Clean dashboard
  - [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Minimal visual indents

- **Development Tools**
  - [telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder with performance tweaks
  - [copilot](https://github.com/github/copilot.vim) - AI code completion
  - [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
  - [conform](https://github.com/stevearc/conform.nvim) - Code formatting
  - [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git integration
  - [comment](https://github.com/numToStr/Comment.nvim) - Smart commenting
  - [todo-comments](https://github.com/folke/todo-comments.nvim) - TODO highlighting
  - [editorconfig](https://github.com/editorconfig/editorconfig-vim) - Consistent coding style

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

### File Management & Search
- `<leader>e` - Toggle file manager (Neo-tree)
- `<leader>o` - Focus file manager
- `<leader>ff` - Find files by name (fuzzy search)
- `<leader>fg` - **Live grep** - Full-text search across project (real-time)
- `<leader>fw` - Find word under cursor across project
- `<leader>fb` - Find open buffers
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

## 🔍 Full-Text Search Guide

### Using Live Grep (`<leader>fg`)
The most powerful search feature for finding text across your entire project:

1. **Start search**: Press `<Space>fg`
2. **Type your query**: Enter search term (supports regex)
3. **Navigate results**: Use `Ctrl+j/k` to move up/down
4. **Preview files**: See file content in right panel
5. **Open file**: Press `Enter` to jump to location

### Search Features
- **Real-time results** as you type
- **Fuzzy matching** with smart case sensitivity
- **File preview** with syntax highlighting
- **Regex support** for advanced patterns
- **Respects gitignore** and excludes build folders
- **Fast FZF integration** for performance

### Other Search Options
- `<leader>fw` - Search word under cursor
- `<leader>ff` - Find files by name
- `<leader>fb` - Search open buffers

## ⚙️ Font Configuration

This configuration includes **JetBrains Mono** with ligatures support:
- **GUI Neovim**: Font configured automatically
- **Terminal**: Set JetBrains Mono in your terminal settings
- **Ligatures**: `==`, `!=`, `->`, `=>` display as single characters

## ⚡️ Performance Features

- **Optimized startup**: Disabled unnecessary built-in plugins
- **Smart caching**: Plugin cache enabled for faster loading
- **Minimal UI**: Streamlined status line and file manager
- **Fast updates**: Reduced timeouts and update intervals
- **Syntax optimization**: Limited syntax highlighting for large files
