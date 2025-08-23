vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--vim.opt.backspace = 3
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true

vim.api.nvim_set_keymap("n", "<Space>m", ":HiMyWordsToggle<CR>", { noremap = true })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<leader>sv', '<C-w>v', {desc="Split window vertically"})
vim.keymap.set('n', '<leader>sh', '<C-w>e', {desc="Split window horizontally"})
vim.keymap.set('n', '<leader>se', '<C-w>=', {desc="Make splits equal size"})
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', {desc="Close current split"})

vim.keymap.set('n', '<leader>th', '<cmd>tabnew<CR>', {desc="Open New Tab"})
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', {desc="Close current tab"})
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', {desc="Go to next tab"})
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', {desc="Go to prev tab"})
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', {desc="Open current buffer in new tab"}) 
