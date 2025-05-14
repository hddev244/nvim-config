return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup({
                automatic_enable = true,
                ensure_installed = {
                    "lua_ls",
                    "jdtls",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable('jdtls')
            vim.lsp.config('jdtls', { cmd = { 'jdtls' } })

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.jdtls.setup({})

            vim.keymap.set('n' , 'lk', vim.lsp.buf.hover, {})
            vim.keymap.set('n' , 'lgo', vim.lsp.buf.type_definition, {})
            vim.keymap.set('n' , 'lgr', vim.lsp.buf.references, {})
        end
    }

}
