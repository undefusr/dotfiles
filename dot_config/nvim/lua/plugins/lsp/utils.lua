local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.on_attach = function(client, bufnr)
  vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
    local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id, false)
    local buf = vim.api.nvim_get_current_buf()
    vim.diagnostic.reset(ns, buf)
    return true
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

M.setup = function()
  local keymap = vim.keymap -- for conciseness

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true }
  -- set keybinds
  bufopts.desc = "Show LSP references"
  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", bufopts) -- show definition, references

  bufopts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts) -- go to declaration

  bufopts.desc = "Show LSP definitions"
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", bufopts) -- show lsp definitions

  bufopts.desc = "Show LSP implementations"
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", bufopts) -- show lsp implementations

  bufopts.desc = "Show LSP type definitions"
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", bufopts) -- show lsp type definitions

  bufopts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts) -- see available code actions, in visual mode will apply to selection

  bufopts.desc = "Smart rename"
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- smart rename

  bufopts.desc = "Show buffer diagnostics"
  keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", bufopts) -- show  diagnostics for file

  bufopts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, bufopts) -- show diagnostics for line

  bufopts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts) -- jump to previous diagnostic in buffer

  bufopts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts) -- jump to next diagnostic in buffer

  bufopts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, bufopts) -- show documentation for what is under cursor

  bufopts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", bufopts) -- mapping to restart lsp if necessary

  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
end

M.lsp_servers = {
  "clangd",
  "tsserver",
  "pyright",
  "lua_ls",
  "eslint",
  "bashls",
  "yamlls",
  "jsonls",
  "graphql",
  "gopls",
  "rust_analyzer",
  "terraformls",
  "sqlls",
  "dockerls",
  "docker_compose_language_service",
  "bufls",
  "helm_ls",
}

M.lsp_kinds = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
  Copilot = " ",
  Namespace = " ",
  Package = " ",
  String = " ",
  Number = " ",
  Boolean = " ",
  Array = " ",
  Object = " ",
  Key = " ",
  Null = " ",
}

M.mason_packages = {
  "bash-language-server",
  "black",
  "clang-format",
  "clangd",
  "css-lsp",
  "eslint-lsp",
  "graphql-language-service-cli",
  "html-lsp",
  "json-lsp",
  "lua-language-server",
  "markdownlint",
  "prettier",
  "pyright",
  "shfmt",
  "taplo",
  "typescript-language-server",
  "yaml-language-server",
  "goimports",
  "editorconfig-checker",
  "rust-analyzer",
}

return M
