-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.colorcolumn = "80,100"
vim.filetype.add({
  -- ...
  -- Some more configurations
  -- ...
  extension = {
    nf = "nextflow",
  },
})

-- Open a dir and make it the working directory
vim.g.root_spec = { "cwd" }
-- Hot patch nvim-lspconfig to add Nextflow language server

-- local nf_ls_jar = "/Users/jf/.bin/nf-language-server/build/libs/language-server-all.jar"
-- require("lspconfig.configs").nextflow_ls = {
--   default_config = {
--     cmd = { "java", "-jar", nf_ls_jar },
--
--     filetypes = { "nextflow" },
--     root_dir = function(fname)
--       local util = require("lspconfig.util")
--       return util.root_pattern("nextflow.config", ".git")(fname)
--     end,
--     settings = {
--       nextflow = {
--         files = {
--           exclude = { ".git", ".nf-test", "work" },
--         },
--       },
--     },
--   },
-- }
--
-- -- Set up the Nextflow language server like any other language server
-- -- (once the language server is added upstream, this will be the only code necessary)
-- require("lspconfig").nextflow_ls.setup({
--   -- capabilities = vim.lsp.protocol.make_client_capabilities(),
--   -- on_attach = function(client, bufnr) end, -- set up on attach function
-- })
