require('bufferline').setup {
    options = {
        mode = "buffers",
        offsets = {
            { filetype = "coc-explorer", text = "File Explorer", padding = 1 },
            { filetype = "neo-tree", text = "File Explorer", padding = 1 },
            { filetype = "Outline", text = "", padding = 1 },
        },
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        separator_style = "thin",
    }
}
