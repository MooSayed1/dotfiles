-- -- EXAMPLE
--
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
-- local on_init = require("nvchad.configs.lspconfig").on_init
-- local capabilities = require("nvchad.configs.lspconfig").capabilities
--
-- local lspconfig = require "lspconfig"
-- local servers = { "html", "cssls"--[[ , "clangd" ]] }
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--   }
-- end
--
-- -- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
--
-- -- Add specific settings for clangd if needed
-- lspconfig.clangd.setup {
--   -- on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   cmd = { "clangd", "--background-index", "--clang-tidy" },
--   filetypes = { "c", "cpp",--[[  "objc", "objcpp"  ]]},
--   root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
--   single_file_support = true
-- }

-- Custom on_attach function to override LSP keybindings
local function custom_on_attach(client, bufnr)
  -- Set keybinding options (without buffer key)
  local opts = { noremap = true, silent = true }

  -- Default LSP keybindings applied only for the specific buffer
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

  -- Optionally disable certain LSP features per server
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
end

-- Use the original on_init and capabilities
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" --[[ , "clangd" ]] }

-- Apply the configuration for each LSP
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach, -- Use the custom on_attach
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- }

-- clangd specific setup
lspconfig.clangd.setup {
  on_attach = custom_on_attach, -- Use custom on_attach for clangd as well
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", --[[  "objc", "objcpp"  ]] },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  single_file_support = true
}
