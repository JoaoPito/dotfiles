local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- lsp.ensure_installed({
--	'tsserver',
--	'pyright',
--	'omnisharp',
--})

lsp.setup()

-- cmp autocomplete keybidings
-- You need to setup `cmp` after lsp-zero

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<Tab>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-l>'] = cmp_action.luasnip_jump_forward(),
    ['<C-o>'] = cmp_action.luasnip_jump_backward(),
  }
})

