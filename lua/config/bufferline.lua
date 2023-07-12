require("bufferline").setup({
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
