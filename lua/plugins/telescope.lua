-- lua/plugins/telescope.lua
return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
      local telescope = require('telescope')
      
      telescope.setup({
        defaults = {
          -- Layout configuration
          layout_config = {
            prompt_position = "top",
            width = 0.75,
            height = 0.75,
            preview_cutoff = 120,
            horizontal = { mirror = false },
            vertical = { mirror = false },
          },
          -- Внешний вид
          sorting_strategy = "ascending",
          prompt_prefix = " ",
          selection_caret = " ",
          entry_prefix = " ",
          initial_mode = "insert",
          layout_strategy = "horizontal",
          -- Игнорируемые паттерны
          file_ignore_patterns = { 
            "%.git/.*",
            "node_modules/.*",
            "%.DS_Store",
            "target/.*",
            "dist/.*",
            "build/.*",
            "%.class",
          },
          winblend = 0,
          border = {},
          borderchars = { "━", "┃", "━", "┃", "╋", "╋", "╋", "╋" },
          color_devicons = true,
          use_less = true,
          set_env = { ['COLORTERM'] = 'truecolor' },
          path_display = { "truncate" },
          
          -- Маппинги внутри Telescope
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<C-n>"] = "cycle_history_next",
              ["<C-p>"] = "cycle_history_prev",
              ["<C-c>"] = "close",
              ["<C-u>"] = "preview_scrolling_up",
              ["<C-d>"] = "preview_scrolling_down",
            }
          }
        },
        -- Расширения
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          }
        }
      })
      
      -- Загрузка расширений
      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')
      
      -- Маппинги
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find word under cursor' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>ee', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
      vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Git commits' })
      vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Git status' })
      
      -- File Browser
      vim.keymap.set('n', '<leader>fe', ':Telescope file_browser<CR>', { noremap = true, desc = 'File browser' })
    end
  }
}
