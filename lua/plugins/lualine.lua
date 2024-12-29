return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional icons support
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true, -- Enable or disable icons in the statusline
				theme = 'catppuccin', -- Set the colorscheme theme for lualine
				section_separators = { left = '', right = '' }, -- Section separator symbols
				component_separators = { left = '', right = '' }, -- Component separator symbols
				disabled_filetypes = { 'alpha', 'neo-tree' }, -- List of filetypes to disable lualine
				always_divide_middle = true, -- Ensure left and right sections are equally divided
			},
			sections = {
				-- Active sections
				lualine_a = {
					{
						'mode', -- Displays the current mode
						fmt = function(str)
							return ' ' .. str -- Prepend an icon to the mode
							-- return ' ' .. str:sub(1, 1) -- Uncomment to display only the first character of the mode
						end,
					},
				},
				lualine_b = { 'branch' }, -- Displays the current Git branch
				lualine_c = {
					{
						'filename', -- Displays the current filename
						file_status = true, -- Show file status (e.g., modified, readonly)
						path = 0, -- 0 = just the filename, 1 = relative path, 2 = absolute path
					},
				},
				lualine_x = {
					{
						'diagnostics', -- Displays diagnostics information
						sources = { 'nvim_diagnostic' }, -- Use the built-in diagnostics source
						sections = { 'error', 'warn' }, -- Show errors and warnings
						symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }, -- Symbols for diagnostics
						colored = true, -- Enable colors for diagnostics
						update_in_insert = false, -- Update diagnostics only outside of insert mode
						always_visible = false, -- Only show diagnostics when there is data
						cond = function()
							return vim.fn.winwidth(0) >
							100 -- Show diagnostics only if the window width is greater than 100
						end,
					},
					{
						'diff', -- Displays Git diff information
						colored = true, -- Enable colors for Git diff
						symbols = { added = ' ', modified = ' ', removed = ' ' }, -- Symbols for added, modified, removed lines
						cond = function()
							return vim.fn.winwidth(0) >
							100 -- Show diff only if the window width is greater than 100
						end,
					},
					{
						'encoding',
						cond = function()
							return vim.fn.winwidth(0) > 100
						end,
					}, -- Show file encoding if window width > 100
					{
						'filetype',
						cond = function()
							return vim.fn.winwidth(0) > 100
						end,
					}, -- Show filetype if window width > 100
				},
				lualine_y = { 'location' }, -- Displays the current cursor location
				lualine_z = { 'progress' }, -- Displays the progress through the file
			},
			inactive_sections = {
				-- Sections for inactive windows
				lualine_a = {
					{
						'buffers', -- Show buffers in inactive windows
					},
				},
				lualine_b = {},
				lualine_c = {
					{ 'filename', path = 1 }, -- Show the relative path of the filename
				},
				lualine_x = {
					{
						require('noice').api.statusline.mode.get, -- Displays Noice mode
						cond = require('noice').api.statusline.mode.has, -- Show only if Noice mode exists
						color = { fg = '#ff9e64' }, -- Custom color for Noice mode
					},
					{
						require('noice').api.status.command.get, -- Displays Noice command status
						cond = require('noice').api.status.command.has, -- Show only if Noice command exists
						color = { fg = '#ff9e64' }, -- Custom color for Noice command
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {}, -- No custom tabline setup
			extensions = { 'fugitive' }, -- Enable lualine for the Fugitive plugin
		}
	end,
}
-- Some useful glyphs:
-- https://www.nerdfonts.com/cheat-sheet
--        
