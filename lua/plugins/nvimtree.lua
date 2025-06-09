return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", },
  config = function()
    -- Figured this out using :h nvimtree
    require('nvim-tree').setup({
      actions = {
        change_dir = {
          enable = false,
          restrict_above_cwd = true,
        },
      },
    })
    local api = require('nvim-tree.api')
    vim.keymap.set('n', '<C-n>', api.tree.toggle, { desc = 'Toggle nvim tree' })
  end
}
