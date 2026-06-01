-- ===================================================================
-- Double to Single Character Plugin for Neovim
-- ===================================================================
-- A lightweight Neovim plugin that replaces double characters with
-- their single counterparts in the current line. Useful for cleaning
-- up markup, formatting text, and fixing typos.
--
-- Version: 1.0.0
-- ===================================================================

-- -------------------------------------------------------------------
-- replace_double_to_single(char)
-- -------------------------------------------------------------------
-- Replaces all occurrences of double characters (two identical 
-- characters in a row) with a single character in the current line.
--
-- @param char string - The single character to process:
--   - '$' - Replace $$ with $ (common in LaTeX math mode)
--   - '"' - Replace "" with " (fix double quotes)
--   - "'" - Replace '' with ' (fix single quotes)
--   - '*' - Replace ** with * (lighten Markdown bold)
--   - '#' - Replace ## with # (reduce Markdown heading level)
--   - Any other character (both special and regular)
-- -------------------------------------------------------------------
function _G.replace_double_to_single(char)
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_get_current_line()
  
  local escaped_char = char:gsub('([%^%$%(%)%%%.%[%]%*%+%-%?])', '%%%1')
  local pattern = escaped_char .. escaped_char
  local replacement = char
  
  local new_line = line:gsub(pattern, replacement)
  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
end
