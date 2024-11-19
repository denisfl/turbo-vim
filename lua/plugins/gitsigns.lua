return {
  'lewis6991/gitsigns.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      numhl = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, desc='Next hunk'})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true, desc='Prev hunk'})

        map('n', '<leader>hp', gs.preview_hunk, {desc='Preview hunk'})
        map('n', '<leader>hr', gs.reset_hunk, {desc='Reset hunk'})
        map('n', '<leader>hs', gs.stage_hunk, {desc='Stage hunk'})
        map('n', '<leader>hu', gs.undo_stage_hunk, {desc='Undo stage hunk'})
        map('n', '<leader>hd', gs.diffthis, {desc='Diff this'})
      end
    })
  end
}
