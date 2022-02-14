return {
    'kyazdani42/nvim-tree.lua',
    requires = {
        { 'kyazdani42/nvim-web-devicons' }
    },
    opt = true,
    keys = { 
        { 'n', '<c-o>' },
    },
    setup = function()
        local config = {
            nvim_tree_root_folder_modifier = table.concat {':t:gs?$?/..', string.rep(' ', 1000), '?:gs?^??'},
            nvim_tree_add_trailing = 0,
            nvim_tree_indent_markers = 1,
            nvim_tree_git_hl = 1,
            nvim_tree_show_icons = {
                git = 1,
                folders = 1,
                files = 1
            },
            nvim_tree_icons = { default = '' },
        }

        for name, value in pairs(config) do
            vim.g[name] = value
        end

    end,
    config = function()
        require('nvim-tree').setup {
           auto_close = true,
           update_focused_file = {
               enable = true,
           },
           filters = {
               dotfiles = true,
           },
        }

        -- Keybinding
        vim.api.nvim_set_keymap('n', '<c-o>', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
    end,
}