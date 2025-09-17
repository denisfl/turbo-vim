 local opt = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

opt.relativenumber = true -- Show relative line numbers
opt.number = true         -- Show line numbers

opt.expandtab = true     -- Use spaces instead of tabs
opt.shiftwidth = 2       -- Shift 2 spaces when tab
opt.tabstop = 2          -- Count of spaces when tab
opt.softtabstop = 2      -- Count of spaces when tab
opt.smartindent = true   -- Smart indent

opt.cursorline = true    -- Highlight the current line
opt.scrolloff = 8        -- Minimum number of lines to keep above and below the cursor
opt.sidescrolloff = 8    -- Minimum number of columns to keep to the left and right of the cursor
opt.cmdheight = 0        -- Height of the command bar
opt.laststatus = 3       -- Get rid of the status line
opt.pumheight = 10       -- Maximum number of items in the popup menu
opt.winbar = nil         -- Disable the window toolbar

-- Set clipboard to use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Performance optimizations
opt.updatetime = 100     -- Faster updates
opt.timeoutlen = 300     -- Faster key sequence timeout
opt.ttimeoutlen = 50     -- Faster escape sequences
opt.redrawtime = 10000   -- Max time for redraw
opt.synmaxcol = 200      -- Limit syntax highlighting column


