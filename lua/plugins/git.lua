return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame_opts = {
          delay = 0,
        },
      })
      local api = require('gitsigns')
      vim.keymap.set("n", "<leader>gs", api.preview_hunk, { desc='Git Preview' })
      api.toggle_current_line_blame(true)
    end
  },
}
