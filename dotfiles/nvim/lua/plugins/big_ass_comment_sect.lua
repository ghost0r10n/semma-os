vim.keymap.set("n", "<leader>cz", function()
  local name = vim.fn.input("Insert name: ")
  local default_comment = vim.fn.input("Comment start char: ")
  local default_comment = ( default_comment ~= "-" and default_comment ) or ""
  if name == "" then return end

  local side_size = 8
  local offset_count = 1

  local word_size = #name
  local upper_side = string.rep("-", side_size)
  local offset = string.rep(" ", offset_count)

  -- Build the two lines
  local upper_section = default_comment .. upper_side .. offset .. name .. offset .. upper_side
  local lower_len = (side_size * 2) + word_size + (offset_count * 2)
  local lower_section = default_comment .. string.rep("-", lower_len)

  -- Insert as two new lines (linewise), below the cursor
  vim.api.nvim_put({ upper_section, lower_section }, "l", true, true)
end, { desc = "Big ass comment section" })



