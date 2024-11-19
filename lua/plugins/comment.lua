return {
  'numToStr/Comment.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require('Comment').setup({
      -- Turn on default mappings
      -- gcc - comment/uncomment line
      -- gc - comment/uncomment selection
      -- gbc - comment/uncomment block
      mappings = {
        basic = true,
        extra = true,
      },
    })

    require('ts_context_commentstring').setup({
      enable_autocmd = false,
    })
  end
}
