return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("todo-comments").setup({
      signs = true,
      keywords = {
        FIX = {
          icon = " ", 
          color = "error", 
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, 
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
      },
      highlight = {
        multiline = true, 
        multiline_pattern = "^.", 
        multiline_context = 10, 
        before = "", 
        keyword = "wide", 
        after = "fg", 
        pattern = [[.*<(KEYWORDS)\s*:]], 
        comments_only = true, 
        max_line_len = 400, 
        exclude = {}, 
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], 
      },
    })

    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })

    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", 
      { desc = "Find todo comments" })
end
}