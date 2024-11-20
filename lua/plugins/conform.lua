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
        vue = { "prettier" }, 
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
          -- Check for a local prettier installation
          command = function()
            local local_prettier = vim.fn.findfile("node_modules/.bin/prettier", ".;")
            if local_prettier ~= "" then
              return local_prettier
            end
            return "prettier"
          end,
          args = {
            "--stdin-filepath",
            "$FILENAME",
          },
          range_args = function(ctx)
            return {
              "--stdin-filepath",
              "$FILENAME",
              "--range-start=" .. ctx.range.start,
              "--range-end=" .. ctx.range["end"],
            }
          end,
          cwd = function()
            -- Look for a local prettier configuration
            local prettier_config = vim.fn.findfile(".prettierrc", ".;")
            local package_json = vim.fn.findfile("package.json", ".;")
            if prettier_config ~= "" then
              return vim.fn.fnamemodify(prettier_config, ":h")
            elseif package_json ~= "" then
              return vim.fn.fnamemodify(package_json, ":h")
            end
            return vim.fn.getcwd()
          end,
        },
      },
    })

    local function format_file()
      local has_prettier_config = vim.fn.findfile(".prettierrc", ".;") ~= "" or
                                vim.fn.findfile("package.json", ".;") ~= ""
      
      if has_prettier_config then
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 3000,
        })
      else
        vim.notify("No prettier config found!", vim.log.levels.WARN)
      end
    end

    vim.keymap.set({ "n", "v" }, "<leader>f", format_file, { desc = "Format file or range" })
  end
}
