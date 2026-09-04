return {
  "saghen/blink.cmp",
  dependencies = { "saghen/blink.lib" },
  opts = {
    fuzzy = { implementation = "lua" },

    sources = {
      default = { "buffer", "path" },
    },
    keymap = {
      ["<C-Space>"] = { "show" },
      ["<C-n>"]     = { "select_next" },
      ["<C-p>"]     = { "select_prev" },
      ["<CR>"]      = { "accept" },
      ["C-e"]       = { "cancel" },
    },
  },
}
