return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", },
  config = function()
    -- not sure why I need this, but without it I get an error that nvim tree is not setup
    -- I figured that the pattern of require(plugin).setup was missing so I tried this and it worked
    require('nvim-tree').setup()
    local api = require('nvim-tree.api')
    vim.keymap.set('n', '<C-n>', api.tree.toggle, { desc = 'Toggle nvim tree' })
  end
}
