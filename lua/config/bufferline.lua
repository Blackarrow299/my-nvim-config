local bufferline = require("bufferline")

bufferline.setup({
	options = {
		numbers = "ordinal",
    hover = {
			Venabled = true,
			delay = 200,
			reveal = {'close'}
		},
		persist_buffer_sort = true,
    enforce_regular_tabs = true,
    show_buffer_icons = true,
		indicator_icon = "▎",
    modified_icon = "●",
		offsets = {
			{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true
			}
		}
	}
})

-- switch buffer using ALT - number
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
		vim.api.nvim_command(':BufferLineGoToBuffer ' .. i)
		-- vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

--close current buffer
 vim.keymap.set("n", '<leader>x', function()
	-- Close the current buffer using Lua
	require('bufdelete').bufdelete(0, true)
 end)

-- next buffer
vim.keymap.set("n", '<C-l>', function()
	vim.api.nvim_command(':BufferLineMoveNext')
end)

-- prev buffer
vim.keymap.set("n", '<C-h>', function()
	vim.api.nvim_command(':BufferLineMovePrev')
end)

-- show only modified buffers
--vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  --callback = function()
    --vim.t.bufs = vim.tbl_filter(function(bufnr)
      --return vim.api.nvim_buf_get_option(bufnr, "modified")
    --end, vim.t.bufs)
  --end,
--})
