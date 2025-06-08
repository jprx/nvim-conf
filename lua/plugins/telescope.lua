return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- https://github.com/nvim-telescope/telescope.nvim
    local builtin = require('telescope.builtin')
    -- open the find files dialog window:
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
    -- search for the word under the cursor:
    vim.keymap.set('n', '<C-f>', builtin.grep_string, { desc = 'Telescope grep string' })
    -- search for anything in the project:
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
  end
}
