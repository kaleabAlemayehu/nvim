-- return {
-- 	{ -- Specify the colorscheme plugin
-- 		'JoosepAlviste/palenightfall.nvim',
-- 		lazy = false,
-- 		priority = 1000, -- Load this plugin early
--
-- 		config = function()
-- 			-- Initialize transparency state
-- 			local is_transparent = true
--
-- 			-- Load the colorscheme with transparency settings
-- 			require('palenightfall').setup {
-- 				transparent = is_transparent,
-- 			}
--
-- 			-- Function to toggle transparency
-- 			local function toggle_transparency()
-- 				is_transparent = not is_transparent
-- 				require('palenightfall').setup {
-- 					transparent = is_transparent,
-- 				}
-- 				-- Apply the colorscheme again
-- 				vim.cmd [[colorscheme palenightfall]]
-- 			end
--
-- 			-- Keymap to toggle transparency
-- 			vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
-- 		end,
-- 	},
-- 	{},
-- }
return {
  'JoosepAlviste/palenightfall.nvim',
  lazy = false,
  priority = 1000, -- Ensure it loads first

  config = function()
    -- Variable to track transparency state
    local is_transparent = true

    -- Function to apply transparency
    local function apply_transparency()
      if is_transparent then
        -- Enable transparency
        vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
        vim.cmd [[highlight NormalNC guibg=NONE ctermbg=NONE]]
      else
        -- Reset to default background
        vim.cmd [[set background=dark]]
        vim.cmd [[colorscheme palenightfall]]
      end
    end

    -- Function to toggle transparency
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
