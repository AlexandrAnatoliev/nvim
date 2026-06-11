-- Подключаю словари для автодополнения
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.dictionary:append("~/.config/nvim/dicts/lua_dict.txt")
    vim.opt_local.dictionary:append("~/.config/nvim/dicts/lua_func.txt")
  end,
})
