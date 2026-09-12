return {
  "saghen/blink.cmp",
  dependencies = { "saghen/blink.lib" },
  opts = {
    keymap = { preset = "default"},
    signature = { enabled = true },
    fuzzy = { implementation = "lua" },
    sources = {
      default = { "lsp", "path", "snippets","buffer" },
      providers = {
        buffer = {
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ''
              end, vim.api.nvim_list_bufs())
            end
          }
        }
      }
    },
  },
}
