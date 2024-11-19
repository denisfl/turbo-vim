-- lua/plugins/copilot.lua
return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      
      -- Tab for accepting suggestions
      vim.keymap.set('i', '<Tab>', [[copilot#Accept("\<CR>")]], {
        expr = true,
        replace_keycodes = false
      })
      
      -- On macOS:
      -- Control + n/p for next/previous suggestion
      -- Control + c to dismiss
      vim.keymap.set('i', '<C-n>', '<Plug>(copilot-next)', { silent = true })
      vim.keymap.set('i', '<C-p>', '<Plug>(copilot-previous)', { silent = true })
      vim.keymap.set('i', '<C-c>', '<Plug>(copilot-dismiss)', { silent = true })
      
      -- In which files to enable/disable Copilot
      vim.g.copilot_filetypes = {
        ["*"] = true,
        ["markdown"] = false,
        ["help"] = false,
        ["TelescopePrompt"] = false,
      }
    end
  }
}
