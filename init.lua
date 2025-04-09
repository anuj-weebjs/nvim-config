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
--vim.call('plug#', 'neoclide/coc.nvim', { branch = 'release' })              -- intellisense
vim.call('plug#', 'meanderingProgrammer/render-markdown.nvim')
vim.call('plug#', 'andweeb/presence.nvim')

vim.call('plug#', 'neovim/nvim-lspconfig')          --
vim.call('plug#', 'hrsh7th/nvim-cmp')               -- Typescript Intellisense
vim.call('plug#', 'hrsh7th/cmp-nvim-lsp')           -- Typescript Intellisense
vim.call('plug#', 'saadparwaiz1/cmp_luasnip')       --


vim.call('plug#end')

-- LSP setup
local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup {
    on_attach = function(client, bufnr)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Show hover info' })
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- nvim-cmp Setup
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true} ),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },  {
        { name = 'buffer' },
    }),
})


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
