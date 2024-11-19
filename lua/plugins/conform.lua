-- lua/plugins/conform.lua
return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  config = function()
    local conform = require("conform")
    
    conform.setup({
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
      
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
      
      formatters = {
        prettier = {
	  command = vim.fn.executable("prettier") == 1 and "prettier" or "npx prettier",
          timeout_ms = 3000,

          env = {
            PRETTIERD_LOCAL_PRETTIER_ONLY = "1",
          },
        },
      },
    })

    -- Маппинг для ручного форматирования
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      })
    end, { desc = "Format file or range" })
  end
}
