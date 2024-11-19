-- lua/plugins/alpha.lua
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
████████╗██╗   ██╗██████╗ ██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗
╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║
   ██║   ██║   ██║██████╔╝██████╔╝██║   ██║██║   ██║██║██╔████╔██║
   ██║   ██║   ██║██╔══██╗██╔══██╗██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║   ╚██████╔╝██║  ██║██████╔╝╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞 " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "󰈔 " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "󰋚 " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "󰊄 " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "󰒓 " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("s", "󰦛 " .. " Restore Session", ":lua require('persistence').load() <CR>"),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", "󰗼 " .. " Quit", ":qa<CR>"),
    }

    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "⚡ TurboVim loaded " .. stats.count .. " plugins in " .. ms .. "ms" }
    end

    dashboard.section.footer.val = footer()

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    dashboard.config.opts.noautocmd = true

    require("alpha").setup(dashboard.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ TurboVim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end
}
