return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight',
          component_separators = { left = '|', right = '|'},
          section_separators = { left = '', right = ''},
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            {
              'filename',
              file_status = true,      -- Показывает статус модификации файла
              path = 1,                -- 0 = просто имя файла, 1 = относительный путь, 2 = абсолютный путь
              shorting_target = 40,    -- Сократить путь до n символов
              symbols = {
                modified = '[+]',      -- Текст для измененного файла
                readonly = '[-]',      -- Текст для файла только для чтения
                unnamed = '[No Name]', -- Текст для безымянного файла
              }
            }
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              'filename',
              path = 1,
              symbols = {
                modified = '[+]',
                readonly = '[-]',
                unnamed = '[No Name]',
              }
            }
          },
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
      })
    end
  }
}
