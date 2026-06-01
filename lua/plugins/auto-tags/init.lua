-- ===================================================================
-- Tag Auto-Close Plugin for Neovim
-- ===================================================================
-- Automatically closes HTML/XML tags when typing '>' in insert mode.
--
-- Examples:
--   <div   + >  →  <div>|</div>      (| indicates cursor position)
--   <span  + >  →  <span>|</span>
--   <h1    + >  →  <h1>|</h1>
--   <my-component + > → <my-component>|</my-component>
-- ===================================================================

-- -------------------------------------------------------------------
-- Helper function: get_unclosed_tag()
-- -------------------------------------------------------------------
-- Scans the text before the cursor to detect an unclosed opening tag.
--
-- Returns:
--   string|nil - The tag name without angle brackets if an opening tag is
--                detected right before the cursor, or nil otherwise.
--
-- Examples:
--   Line: '<div'       Cursor: after 'v'  →  Returns: 'div'
--   Line: '<div '      Cursor: after ' '  →  Returns: nil (space after name)
--   Line: '<h1>text'   Cursor: after '>'  →  Returns: nil ('>' already typed)
--   Line: 'text<div'   Cursor: after 'v'  →  Returns: 'div'
-- -------------------------------------------------------------------
local function get_unclosed_tag()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local before_cursor = line:sub(1, col)
  local tag_start, tag_end = before_cursor:find('<[%w-]+$')
  if not tag_start then
    return nil
  end
  return line:sub(tag_start + 1, tag_end)
end

-- -------------------------------------------------------------------
-- Global function: _G.tag_close()
-- -------------------------------------------------------------------
-- Called when the '>' key is pressed in insert mode. Acts as a smart key
-- handler that either completes an HTML/XML tag or types a regular '>'.
--
-- Global scope (_G) is used so the function can be called from Vimscript
-- or key mappings that require global accessibility.
-- -------------------------------------------------------------------
function _G.tag_close()
  local tag = get_unclosed_tag()
  if tag then
    local closed_tag = '</' .. tag .. '>'
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '>' .. closed_tag })
    vim.api.nvim_win_set_cursor(0, { row, col + 1 })
  else
    vim.api.nvim_feedkeys('>', 'n', false)
  end
end
