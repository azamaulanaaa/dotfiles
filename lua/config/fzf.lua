return {
	'junegunn/fzf.vim',
	requires = {
		{ 
			'junegunn/fzf',
			run = function()
				vim.fn['fzf#install']()
			end,
		},
		{ 'tpope/vim-fugitive' },
	},
	opt = true,
	keys = { 
		{'n', '<leader>ff' },
	},
	setup = function()
		-- Disable preview window
		vim.g.fzf_preview_window = {}
	end,
	config = function()
		-- Custom FZF
		function fzf()
			if vim.fn['fugitive#head']() ~= '' then
				-- Ignore files in .gitignore
				vim.cmd('GFiles --cached --others --exclude-standard')
				return
			end

			vim.cmd('Files')
			return
		end
		
		-- Keybinding
		vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua fzf()<cr>]], { noremap = true, silent = true})	
	end,
}
