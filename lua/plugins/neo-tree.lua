-- lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Smart focus function
    local function smart_focus()
      local current_win = vim.api.nvim_get_current_win()
      vim.cmd("Neotree focus")
      
      -- If we were already in Neo-tree window, go back to the last active window
      if current_win == vim.api.nvim_get_current_win() then
        vim.cmd("wincmd p")
      end
    end

    require("neo-tree").setup({
      close_if_last_window = true,  -- Закрывать Neo-tree если это последнее окно
      window = {
        position = "right",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = "none", -- отключаем конфликтующие маппинги
        }
      },
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        filtered_items = {
          visible = true,
          hide_hidden = true,
          hide_by_name = {
            ".git",
            ".DS_Store",
          },
        }
      },
      default_component_configs = {
        indent = {
          padding = 0,
          with_expanders = true,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        modified = {
          symbol = "●",
        },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.signcolumn = "auto"
          end,
        },
        {
          event = "file_opened",
          handler = function()
            -- Опционально: автоматически возвращаем фокус на файл при открытии
            vim.cmd("wincmd p")
          end
        },
      },
    })

    -- Маппинги
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>o', smart_focus, { noremap = true, silent = true })

    -- Автоматически закрывать Neo-tree при выходе из Vim
    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        vim.cmd("Neotree close")
      end
    })
  end,
}
