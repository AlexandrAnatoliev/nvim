return {
  "saghen/blink.cmp",
  dependencies = { "saghen/blink.lib" },
  opts = {
    fuzzy = { implementation = "lua" },
    sources = {
      default = { "buffer", "path" },
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
