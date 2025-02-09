local lspconfig = require("lspconfig")

-- Extend LSP capabilities for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- Define servers and settings
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = { callSnippet = "Replace" },
      },
    },
  },
  jdtls = {},
}

-- Setup Mason
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = vim.tbl_keys(servers),
})

-- Setup each LSP
for server_name, server_config in pairs(servers) do
  server_config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
  lspconfig[server_name].setup(server_config)
end

-- Ensure required tools are installed
local ensure_installed = vim.tbl_keys(servers)
vim.list_extend(ensure_installed, { "stylua" })
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
