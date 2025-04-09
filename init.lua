-- General Settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"


-- Plugins Setup with vim-plug
vim.call('plug#begin', '~/AppData/Local/nvim/plugged')

-- Plugins

vim.call('plug#', 'morhetz/gruvbox')                    -- Retro Theme
vim.call('plug#', 'nvim-tree/nvim-tree.lua')            -- File explorer
vim.call('plug#', 'nvim-treesitter/nvim-treesitter')    -- Better syntax highligting
vim.call('plug#', 'tpope/vim-fugitive')                 -- Git integration
vim.call('plug#', 'vim-airline/vim-airline')            -- Fanc status line
vim.call('plug#', 'neoclide/coc.nvim', { branch = 'release' })              -- intellisense


vim.call('plug#end')

-- Theme
vim.cmd('colorscheme gruvbox')

-- Plugin Configs
require('nvim-tree').setup()
require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "python", "javascript", 'typescript', 'c', 'cpp', 'json'},
    highlight = { enable = true },
}

-- Key Mappings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true } )
