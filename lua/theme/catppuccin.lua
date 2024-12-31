return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000, -- Ensure it loads first
  config = function()
    -- Setup Catppuccin with custom configuration
    require('catppuccin').setup {
      flavour = 'auto', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false, -- disables setting the background color
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general highlight groups
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
      },
    }

    -- Set the colorscheme
    vim.cmd.colorscheme 'catppuccin'

    -- Transparency Configuration
    local is_transparent = true -- Variable to track transparency state

    local function apply_transparency()
      if is_transparent then
        -- Enable transparency
        vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
        vim.cmd [[highlight NormalNC guibg=NONE ctermbg=NONE]]
        vim.cmd [[highlight NeoTreeNormal guibg=NONE ctermbg=NONE]]
        vim.cmd [[highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE]]
      else
        -- Reset to default background
        vim.cmd [[set background=dark]]
        vim.cmd [[colorscheme catppuccin]]
      end
    end

    local function toggle_transparency()
      is_transparent = not is_transparent
      apply_transparency()
    end

    -- Apply initial transparency
    apply_transparency()

    -- Keymap to toggle transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
