-- lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
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
      close_if_last_window = true,  -- Close Neo-tree if it's the last window
      popup_border_style = "rounded",
      window = {
        position = "right",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = "none", -- disable conflicting mappings
          ["<tab>"] = "toggle_node", -- quick navigation
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
      },
    })

    -- Mappings
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>o', smart_focus, { noremap = true, silent = true })

    -- Automatically open Neo-tree when starting with a directory
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
          vim.cmd("Neotree show")
          -- Focus back to the main window
          vim.cmd("wincmd p")
        end
      end
    })

    -- Close Neo-tree when the last buffer is closed
    vim.api.nvim_create_autocmd('QuitPre', {
      callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("neo%-tree") ~= nil then
            table.insert(tree_wins, w)
          end
          if vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_wins, w)
          end
        end
        if #wins - #floating_wins - #tree_wins == 1 then
          vim.cmd("Neotree close")
        end
      end
    })

    -- Automatically close Neo-tree when exiting Vim
    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        vim.cmd("Neotree close")
      end
    })
  end,
}
