-- search for the selected text
vim.cmd("vnoremap // y/<C-R>\"<CR>\"")

-- buffers management
vim.cmd("map <C-k> :bn<CR>")
vim.cmd("map <C-j> :bp<CR>")
vim.cmd("map <C-x> :bw<CR>")
